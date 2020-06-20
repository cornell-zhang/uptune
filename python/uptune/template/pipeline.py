import zmq
import sys
import random
import time
import numpy
import zlib
import pickle
from threading import Thread


class SerializingSocket(zmq.Socket):
    """A class with some extra serialization methods
    
    send_zipped_pickle is just like send_pyobj, but uses
    zlib to compress the stream before sending.
    
    send_array sends numpy arrays with metadata necessary
    for reconstructing the array on the other side (dtype,shape).
    """
    
    def send_zipped_pickle(self, obj, flags=0, protocol=-1):
        """pack and compress an object with pickle and zlib."""
        pobj = pickle.dumps(obj, protocol)
        zobj = zlib.compress(pobj)
        return self.send(zobj, flags=flags)
    
    def recv_zipped_pickle(self, flags=0):
        """reconstruct a Python object sent with zipped_pickle"""
        zobj = self.recv(flags)
        pobj = zlib.decompress(zobj)
        return pickle.loads(pobj)

    def send_array(self, A, flags=0, copy=True, track=False):
        """send a numpy array with metadata"""
        md = dict(
            dtype = str(A.dtype),
            shape = A.shape,
        )
        self.send_json(md, flags|zmq.SNDMORE)
        return self.send(A, flags, copy=copy, track=track)

    def recv_array(self, flags=0, copy=True, track=False):
        """recv a numpy array"""
        md = self.recv_json(flags=flags)
        msg = self.recv(flags=flags, copy=copy, track=track)
        A = numpy.frombuffer(msg, dtype=md['dtype'])
        return A.reshape(md['shape'])


class SerializingContext(zmq.Context):
    _socket_class = SerializingSocket


def distribute(cfgs, stage):
    """
    distribute tasks from top-level controler 
    """
    port = str(5559 + 2 * stage)
    context = SerializingContext()
    socket = context.socket(zmq.REQ)
    socket.connect ("tcp://localhost:%s" % port)

    for index in range (len(cfgs)):
        cfg = cfgs[index]
        socket.send_zipped_pickle([index, cfg])
        # get the reply.
        message = socket.recv()
        # print "Received reply ", "[", message, "]"


def device(front, end):
    """
    ZeroMQ device pipeline for forwarding tasks 
    """
    try:
        context = SerializingContext(1)
        # Socket facing clients
        frontend = context.socket(zmq.XREP)
        frontend.bind("tcp://*:" + str(front))
        # Socket facing services
        backend = context.socket(zmq.XREQ)
        backend.bind("tcp://*:" + str(end))

        zmq.device(zmq.QUEUE, frontend, backend)
    except Exception as e:
        print(e)
        print("bringing down zmq device")
    finally:
        pass
        frontend.close()
        backend.close()
        context.term()


def server(stage):
    """
    ZeroMQ server process proposal and return qor 
    """
    port = str(5560 + 2 * stage)
    context = SerializingContext()
    socket = context.socket(zmq.REP)
    socket.connect("tcp://localhost:%s" % port)

    while True:
        message = socket.recv_zipped_pickle()
        socket.send(("World from server %s" % message).encode('ascii'))
        break
    return message 


if __name__ == "__main__":
    # testing the distribute/collect model
    queue = Thread(target=device, args=(5559, 5560))
    queue.daemon = True
    queue.start()

    servers = [ Thread(target=server, args=(0,)) for i in range(2) ]
    [p.start() for p in servers]
    distribute([[1, 3], [4, 9]], 0)

    

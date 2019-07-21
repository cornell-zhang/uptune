#-----------------------------------------------------------------------------
#  Copyright (c) 2010 Brian Granger
#
#  Distributed under the terms of the New BSD License.  The full license is in
#  the file COPYING.BSD, distributed as part of this software.
#
#  Uses REQ/REP (on PUB/SUB socket + 1) to synchronize
#-----------------------------------------------------------------------------

import sys
import time
import zmq


def subscriber(stage, index):
    """
    retrieve data from stack
    stage # + parallel idx
    """
    port = 8000 + stage * 20 + index * 2
    ctx = zmq.Context()
    s = ctx.socket(zmq.SUB)
    s.connect("tcp://localhost:%d" % port)
    s.setsockopt(zmq.SUBSCRIBE, b'')

    def sync(port):
        sync_with = "tcp://localhost:%d" % port 
        ctx = zmq.Context.instance()
        s = ctx.socket(zmq.REQ)
        s.connect(sync_with)
        s.send(b'READY')
        s.recv()

    sync(port + 1)
    a = s.recv_pyobj()
    return a


def publisher(stage, index, cfg):
    """
    push data into stack
    """
    array_size = 20
    port = 8000 + stage * 20 + index * 2
    ctx = zmq.Context()
    s = ctx.socket(zmq.PUB)
    s.bind("tcp://*:%d" % port)

    def sync(port):
        sync_with = "tcp://*:%d" % port
        ctx = zmq.Context.instance()
        s = ctx.socket(zmq.REP)
        s.bind(sync_with)
        s.recv()
        s.send(b'GO')

    sync(port + 1)
    s.send_pyobj(cfg)


if __name__ == "__main__":
    from multiprocessing.pool import ThreadPool
    pool = ThreadPool(processes=6)
    dicts = [{u'MEFTRRHX': 8}, {u'MEFTRRHX': 9}, {u'MEFTRRHX': 6}]
    [ pool.apply_async(publisher, (0, _, dicts[_])) for _ in range(3) ]
    res_sub1 = pool.apply_async(subscriber, (0, 0))
    res_sub2 = pool.apply_async(subscriber, (0, 1))
    res_sub3 = pool.apply_async(subscriber, (0, 2))
    print(res_sub1.get())
    print(res_sub2.get())
    print(res_sub3.get())

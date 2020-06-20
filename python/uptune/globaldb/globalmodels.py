from builtins import object
from uptune.opentuner.resultsdb.models import CompressedPickler
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.ext.declarative import declared_attr
from sqlalchemy.orm import scoped_session, sessionmaker
from sqlalchemy import create_engine
from sqlalchemy.orm import relationship, backref
from sqlalchemy import (
  Column, Integer, String, DateTime, Boolean, Enum,
  Float, PickleType, ForeignKey, Text, func, Index)
import sqlalchemy, re
from sqlalchemy import desc, asc

class Base(object):
  @declared_attr
  def __tablename__(cls):
    return re.sub(r'([a-z])([A-Z])', r'\1_\2', cls.__name__).lower()
  id = Column(Integer, primary_key=True, index=True)

Base = declarative_base(cls=Base)

class GlobalResult(Base):
  epoch        = Column(Integer)
  node         = Column(Integer)
  hashv        = Column(String(64))
  data         = Column(PickleType(pickler=CompressedPickler))
  time         = Column(DateTime)
  technique    = Column(Enum('seed', 
                             'DifferentialEvolutionAlt', 
                             'UniformGreedyMutation',
                             'NormalGreedyMutation',
                             'RandomNelderMead',
                             name='technique'),
                        default='seed')
  result       = Column(Float)
  was_the_best = Column(Boolean)

  @classmethod
  def get(cls, session, hashv, datav):
    try:
      session.flush()
      return (session.query(GlobalResult)
              .filter_by(hashv=hashv).first())
    except sqlalchemy.orm.exc.NoResultFound:
      return None

  @classmethod
  def extract(cls, session, node, epoch):
    try:
      session.flush()
      return (session.query(GlobalResult)
              .filter(GlobalResult.node != node)
              .filter(GlobalResult.epoch == epoch).all())
    except sqlalchemy.orm.exc.NoResultFound:
      return None

def globalconnect(dbstr):
    engine = create_engine(dbstr, echo = False)
    connection = engine.connect()
    Base.metadata.create_all(engine)
    Session = scoped_session(sessionmaker(autocommit=False,
                                          autoflush=False,
                                          bind=engine))
    Session.commit()
    return engine, Session 

if __name__ == '__main__':
    engine = create_engine('sqlite:///:memory:', echo=True)
    Base.metadata.create_all(engine)
    egine, session = globalconnect('sqlite:///test.db') 


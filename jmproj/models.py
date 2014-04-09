from sqlalchemy import (
    Column,
    Index,
    Integer,
    Text,
    Unicode,
    DateTime
    )

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import (
    scoped_session,
    sessionmaker,
    )

#from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker())
Base = declarative_base()


class CompteRendu(Base):
    __tablename__ = 'compte_rendu'
    id = Column(Integer, primary_key=True)
    compte_rendu = Column(Unicode(1024))
    date_ecriture = Column(DateTime)
    projet = Column(Unicode(255))
    value = Column(Integer)


#Index('my_index', MyModel.name, unique=True, mysql_length=255)

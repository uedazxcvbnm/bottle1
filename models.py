from sqlalchemy import Column, Integer,\
    String, Text, text, create_engine,\
        DATETIME,Boolean,DateTime
from sqlalchemy.sql import func
from sqlalchemy.orm import sessionmaker
#from sqlalchemy.ext.declarative import\
#    declarative_base
from sqlalchemy.orm import declarative_base
from datetime import datetime

DATABASE = 'postgresql'
USER     = 'book_user'
PASSWORD = '<!--DBに設定したパスワード-->'
HOST     = 'localhost'
PORT     = '5432'
DB_NAME  = 'book_data'

#DB接続情報を指定する
URL = '{}://{}:{}@{}:{}/{}'.format(DATABASE,\
    USER, PASSWORD, HOST, PORT, DB_NAME)
#ORMのエンジンを作る
engin = create_engine(URL, echo=True)
#ORMのベースを取得する
Base = declarative_base()
#DBのセッションを作る
Connection = sessionmaker(bind=engin)
#DBのコネクションを作る
connection = Connection()

#各テーブルのモデルクラスを作る
#Baseを継承する
class Books(Base):
    '''
    booksテーブルのモデル
    '''
    __tablename__ = "books"
    id_ = Column('id', Integer, primary_key = True)
    name = Column('name', String(255))
    volume = Column('volume', String(255))
    author = Column('author', String(255))
    publisher = Column('publisher', String(255))
    memo = Column('memo', Text())
    create_date = Column('create_date',\
        DateTime(timezone=True), default=func.now(), nullable=False)
    delFlg = Column('del', Boolean)

class BookUser(Base):
    '''
    book_userテーブルのモデル
    '''
    __tablename__ = "book_user"
    user_id = Column('user_id', String(255), primary_key = True)
    passwd = Column('passwd', String(255), nullable=False)
    email = Column('email', String(255), nullable=False)
    user_shi = Column('user_shi', String(255))
    user_mei = Column('user_mei', String(255))
    delFlg = Column('del', Boolean)

if __name__ == "__main__":
    #マイグレーションを実行する
    Base.metadata.create_all(engin)
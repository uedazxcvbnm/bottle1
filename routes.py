'''
セッションを作る機能も担う
静的コンテンツを扱うパスルーティング
'''
from bottle import Bottle,\
    jinja2_template as template,\
        static_file, request, redirect
from bottle import response
from models import connection, Books
from utils.util import Utils
from utils.session import Session
from utils.auth import Auth

#セッションを作る
app = Bottle()
sess = Session()
app_sess = sess.create_session(app)

'''
画像,CSS,JSなどの固定コンテンツは
これで処理する
'''
@app.get('/static/<filePath:path>')
def static(filePath):
    return static_file(filePath, root='./static')

@app.route('/test')
def test():
    aaa = request.query.test
    return aaa
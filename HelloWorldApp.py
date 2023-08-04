import time
import stomp
from flask import Flask

def create_flask_app():
    app = Flask(__name__)
    
    @app.route('/')
    def hello():
        return 'Hello World!'

    return app

class ActiveMQConsumer(stomp.ConnectionListener):
    def __init__(self):
        self.conn = stomp.Connection()
        self.conn.set_listener('', self)
        self.conn.connect('admin', 'password', wait=True)
        self.conn.subscribe(destination='/queue/app-queue', id=1, ack='auto')

    def on_error(self, message):
        print('received an error "%s"' % message.body)
        
    def on_message(self, message):
        print('received a message "%s"' % message.body)
        
    def disconnect(self):
        self.conn.disconnect()

def main():
    app = create_flask_app()
    consumer = ActiveMQConsumer()

    try:
        consumer.conn.send(body='Hello World!', destination='/queue/app-queue')
        app.run(host='0.0.0.0', port=80, debug=True)
    finally:
        consumer.disconnect()

if __name__ == '__main__':
    main()

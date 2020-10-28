from flask import Flask
import os
import socket

app = Flask(__name__)
ip = socket.gethostbyname(socket.gethostname())

@app.route("/")
def hello():
  html = "<h3>Hello World! (" + ip + ")</h3>"
  return html.format()

if __name__ == "__main__":
  app.run(host='0.0.0.0', port=80)


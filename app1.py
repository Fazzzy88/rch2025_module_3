from flask import Flask, request, Response
import socket

app = Flask(__name__)

@app.route("/")
def hello():
    return f"""
Server hostname <b>{socket.gethostname()}</b> {request.host}<br/>
Using IP <b>{request.remote_addr}</b><br/>
URL is {request.url}
"""

@app.route("/headers")
def headers():
    return Response(str(request.headers), mimetype='text/plain')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)

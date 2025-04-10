from flask import Flask, request, Response
import socket
import logging
import logging.handlers

app = Flask(__name__)

syslog_handler = logging.handlers.SysLogHandler(address=('localhost', 514))
formatter = logging.Formatter('%(asctime)s %(levelname)s %(message)s')
syslog_handler.setFormatter(formatter)

app.logger.addHandler(syslog_handler)
app.logger.setLevel(logging.INFO)

@app.route("/")
def hello():
    app.logger.info(f"Request to '/' from {request.remote_addr}")
    return f"""
Server hostname <b>{socket.gethostname()}</b> {request.host}<br/>
Using IP <b>{request.remote_addr}</b><br/>
URL is {request.url}
"""

@app.route("/headers")
def headers():
    app.logger.info(f"Request to '/headers' from {request.remote_addr}")
    return Response(str(request.headers), mimetype='text/plain')

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=80)

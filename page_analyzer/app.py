from flask import Flask, render_template  # request, session, url_for, redirect
from flask_session import Session
from .configuration import Config

app = Flask(__name__)
app.config.from_object(Config)
Session(app)


@app.route('/')
def main():
    return render_template('index.html', var="Hello, World")

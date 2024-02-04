from datetime import datetime
import os
import pyodbc
from flask import Flask, jsonify, render_template, request,  redirect, sessions, url_for, flash, session
from flask_bcrypt import Bcrypt
from functools import wraps
from werkzeug.security import generate_password_hash
from werkzeug.utils import secure_filename
# from flask_sse import sse
import json
from flask_socketio import SocketIO, emit, join_room

# from flask_login import current_user, login_required
app = Flask(__name__)
bcrypt = Bcrypt(app)
socketio = SocketIO(app)

@app.route("/")
def index():
    return render_template("Boutique/index.html")

@app.route("/boutique")
def boutique():
    return render_template("Boutique/boutique.html")

@app.route("/Details-produit")
def DetailsProduit():
    return render_template("Boutique/Details-produit.html")

@app.route("/Panier")
def Panier():
    return render_template("Boutique/Panier.html")

@app.route("/Verifier")
def Verifier():
    return render_template("Boutique/Verifier.html")

@app.route("/Accueil")
def Accueil():
    return render_template("DashboadAdmin/accueil_dash.html")


if __name__ == "__main__":
    app.secret_key = 'admin123'
    socketio.run(app, debug=True)
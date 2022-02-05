from flask import Flask, request, Response, jsonify
from flask_sqlalchemy import SQLAlchemy

from flask_jwt_extended import (
    JWTManager, jwt_required, create_access_token, get_jwt_identity
)

app = Flask(__name__)
db = SQLAlchemy(app)
jwt = JWTManager(app)

app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:@localhost:3306/database'
app.config['JWT_SECRET_KEY'] = "a6c4a4b201b31d7cc1a2cb48497874ce"

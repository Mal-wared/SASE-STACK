from flask import Flask, request, jsonify
from flask_cors import CORS
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import create_engine, MetaData, Table
from sqlalchemy.orm import sessionmaker
from werkzeug.security import generate_password_hash, check_password_hash
from tables import User, Category
import os
import re

# Create a flask app 
app = Flask(__name__, template_folder = 'frontend', static_folder = 'frontend')
app.secret_key = 'secret_key'

# Allow frontend requests to backend
CORS(app, origins=["http://127.0.0.1:5500"], methods=["GET", "POST", "OPTIONS"])
# CORS(app)

directory = 'backend'
db_filename = 'User.db'
db_path = f"{os.path.join(os.getcwd(), directory, db_filename)}"

# Create an engine object and a session object to connect to database and query/commit data
engine = create_engine(f"sqlite:///{db_path}", echo=True, connect_args={"check_same_thread":False})
Session = sessionmaker(bind=engine)
session = Session()

# Put session queries/commits here
users = session.query(User).all()

session.close()

@app.route('/sign-up', methods=['POST'])
def sign_up():
    data = request.get_json()
    name = data.get('name')
    email = data.get('email')
    password = data.get('password')
    confirm_password = data.get('confirm-password')

    if not all([name, email, password, confirm_password]):
        return jsonify({'status': 'error', 'message': 'All fields are required'}), 400

    if password != confirm_password:
        return jsonify({'status': 'error', 'message': 'Passwords do not match'}), 400

    session = Session()

    # Check if user already exists
    existing_user = session.query(User).filter_by(email=email).first()
    if existing_user:
        session.close()
        return jsonify({'status': 'error', 'message': 'User already exists'}), 400

    # Hash the password
    hashed_password = generate_password_hash(password)

    # Create new user
    new_user = User(name=name, email=email, password=hashed_password)

    # Add to database
    session.add(new_user)
    session.commit()
    session.close()

    return jsonify({'status': 'success', 'message': 'User registered successfully'})

@app.route('/login', methods=['POST'])
def login():
    data = request.get_json()
    email = data.get('email')
    password = data.get('password')

    if not all([email, password]):
        return jsonify({'status': 'error', 'message': 'All fields are required'}), 400

    session = Session()

    # Check if user exists
    user = session.query(User).filter_by(email=email).first()
    if not user:
        session.close()
        return jsonify({'status': 'error', 'message': 'User does not exist'}), 400

    # Check password
    if not check_password_hash(user.password, password):
        session.close()
        return jsonify({'status': 'error', 'message': 'Invalid password'}), 400

    session.close()

    #userid will be stored in localstorage
    return jsonify({'status': 'success', 'message': 'Login successful', 'userid': user.id})

@app.route('/add-category', methods=['POST'])
def add_category():
    data = request.get_json()
    userid = data.get('userid')
    name = data.get('name')

    if not all([userid,name]):
        return jsonify({'status': 'error', 'message': 'All fields are required'}), 400

    session = Session()

    # Check if category already exists
    existing_category = session.query(Category).filter_by(name=name).first()
    if existing_category:
        session.close()
        return jsonify({'status': 'error', 'message': 'Duplicate category'}), 400

    # Create new category
    new_category = Category(userid=userid,name=name)

    # Add to database
    session.add(new_category)
    session.commit()
    session.close()

    return jsonify({'status': 'success', 'message': 'Category added', 'userid': userid, 'name': name})

@app.route('/get-categories', methods=['GET'])
def get_categories():
    data = request.headers
    userid = data.get('userid')

    session = Session()
    categories = session.query(Category).filter_by(userid=userid).all()
    session.close()

    if categories:
        categories_list = [{'name': cat.name} for cat in categories]
        return jsonify({'status': 'success', 'message': 'Categories got', 'categories': categories_list})
    else:
        return jsonify({'status': 'error', 'message': 'Categories not got'})
    

if __name__ == '__main__':
    app.run(debug=True)


from flask import Flask, jsonify, request
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from tables import Base, Category, Item
import os

app = Flask(__name__)

# Database setup
directory = 'backend'
db_filename = 'User.db'
db_path = os.path.join(os.getcwd(), directory, db_filename)

engine = create_engine(f"sqlite:///{db_path}", echo=True, connect_args={"check_same_thread": False})
Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)

@app.route('/categories', methods=['GET', 'POST'])
def handle_categories():
    session = Session()
    if request.method == 'POST':
        data = request.json
        new_category = Category(name=data['name'])
        session.add(new_category)
        session.commit()
        session.close()
        return jsonify({"message": f"Category '{data['name']}' added."}), 201
    else:
        categories = session.query(Category).all()
        result = [{"id": c.id, "name": c.name} for c in categories]
        session.close()
        return jsonify(result)

@app.route('/items', methods=['GET', 'POST'])
def handle_items():
    session = Session()
    if request.method == 'POST':
        data = request.json
        new_item = Item(name=data['name'], category_id=data['category_id'])
        session.add(new_item)
        session.commit()
        session.close()
        return jsonify({"message": f"Item '{data['name']}' added."}), 201
    else:
        items = session.query(Item).all()
        result = [{"id": i.id, "name": i.name, "category": i.category.name if i.category else None} for i in items]
        session.close()
        return jsonify(result)

@app.route('/category/<int:category_id>/items', methods=['GET'])
def get_items_by_category(category_id):
    session = Session()
    category = session.query(Category).filter_by(id=category_id).first()
    if not category:
        session.close()
        return jsonify({"error": "Category not found"}), 404

    result = [{"id": i.id, "name": i.name} for i in category.items]
    session.close()
    return jsonify(result)

if __name__ == '__main__':
    app.run(debug=True)
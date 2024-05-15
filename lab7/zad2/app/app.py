from flask import Flask, jsonify
from pymongo import MongoClient

app = Flask(__name__)

# Konfiguracja bazy danych MongoDB
client = MongoClient('mongodb://zad1-db-1":27017/')
db = client['test']
collection = db['users']

@app.route('/data', methods=['GET'])
def get_data():
    # Pobierz dane z bazy MongoDB
    data = list(collection.find({}, {'_id': False}))  # Wyklucz pole _id
    return jsonify(data)

if __name__ == '__main__':
    app.run(debug=True)

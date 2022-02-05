from sqlalchemy import ForeignKey
from config import *
import json

from Magazzino import *
from Categoria import *

class Prodotto(db.Model):
    __tablename__ = "prodotti"
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(20))
    quantita = db.Column(db.String(20))
    prezzo = db.Column(db.String(20))
    data = db.Column(db.String(20))
    categoria = db.Column(db.Integer, ForeignKey('categorie.id'))
    magazzino = db.Column(db.Integer, ForeignKey('magazzini.id'))

    def json(self):
        return {'id': self.id, 'nome': self.nome, 'quantita': self.quantita, 'prezzo': self.prezzo, 'data': self.data, 'categoria': self.categoria, 'magazzino': self.magazzino}

    def add(nome, quantita, prezzo, data, categoria, magazzino):
        new_categoria = Prodotto(nome=nome, quantita=quantita, prezzo=prezzo, data=data, categoria=categoria, magazzino=magazzino)
        db.session.add(new_categoria)
        db.session.commit()

    def get_all():
        return [Prodotto.json(prodotto) for prodotto in Prodotto.query.all()]

    def get(id):
        return [Prodotto.json(Prodotto.query.filter_by(id=id).first())]

    def update(id, nome, quantita, prezzo, data, categoria, magazzino):
        prodotto_to_update = Prodotto.query.filter_by(id=id).first()
        prodotto_to_update.nome = nome
        prodotto_to_update.quantita = quantita
        prodotto_to_update.prezzo = prezzo
        prodotto_to_update.data = data
        prodotto_to_update.categoria = categoria
        prodotto_to_update.magazzino = magazzino
        db.session.commit()

    def delete(id):
        Prodotto.query.filter_by(id=id).delete()
        db.session.commit()

@app.route('/prodotto', methods=['POST'])
@jwt_required()
def prodotto_create():
    if not request.json:
        return 'Missing json data', 400

    nome = request.json.get('nome')
    quantita = request.json.get('quantita')
    prezzo = request.json.get('prezzo')
    data = request.json.get('data')
    categoria = request.json.get('categoria')
    magazzino = request.json.get('magazzino')

    if not nome:
        return 'Missing "nome"', 400
    if not quantita:
        return 'Missing "quantita"', 400
    if not prezzo:
        return 'Missing "prezzo"', 400
    if not data:
        return 'Missing "data"', 400
    if not categoria:
        return 'Missing "categoria"', 400
    if not magazzino:
        return 'Missing "magazzino"', 400

    if not Categoria.query.filter_by(id=categoria).first():
        return '"Categoria" not found'

    if not Magazzino.query.filter_by(id=magazzino).first():
        return '"Magazzino" not found'
    
    Prodotto.add(nome, quantita, prezzo, data, categoria, magazzino)
    return 'Prodotto added', 200

@app.route('/prodotto', methods=['GET'])
@jwt_required()
def prodotto_get():
    if not request.json:
        return 'Missing json data', 400

    index = request.json.get('index')
    amount = request.json.get('amount')

    if not index:
        return 'Missing "index"', 400
    if not amount:
        return 'Missing "amount"', 400

    try:
        index = int(index)
        amount = int(amount)
    except:
        return '"index" or "amount" not an integer', 400

    prodotti = Prodotto.get_all()[index:index + amount]

    if not prodotti:
        return 'Prodotto not found', 400
    
    return {'prodotti':prodotti}, 200

@app.route('/prodotto', methods=['PUT'])
@jwt_required()
def prodotto_update():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')
    nome = request.json.get('nome')
    quantita = request.json.get('quantita')
    prezzo = request.json.get('prezzo')
    data = request.json.get('data')
    categoria = request.json.get('categoria')
    magazzino = request.json.get('magazzino')

    if not id:
        return 'Missing "id"', 400
    if not nome:
        return 'Missing "nome"', 400
    if not quantita:
        return 'Missing "quantita"', 400
    if not prezzo:
        return 'Missing "prezzo"', 400
    if not data:
        return 'Missing "data"', 400
    if not categoria:
        return 'Missing "categoria"', 400
    if not magazzino:
        return 'Missing "magazzino"', 400

    if not Categoria.query.filter_by(id=categoria).first():
        return '"Categoria" not found'

    if not Magazzino.query.filter_by(id=magazzino).first():
        return '"Magazzino" not found'
    
    Prodotto.update(id, nome, quantita, prezzo, data, categoria, magazzino)
    return 'Prodotto added', 200

@app.route('/prodotto', methods=['DELETE'])
@jwt_required()
def prodotto_delete():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')

    if not id:
        return 'Missing "id"', 400

    prodotto = Prodotto.query.filter_by(id=id).first() 
    if not prodotto:
        return 'Prodotto not found', 400
    
    Prodotto.delete(prodotto.id)
    return 'Prodotto removed', 200
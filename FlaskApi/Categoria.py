from config import *
import json

class Categoria(db.Model):
    __tablename__ = "categorie"
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(20))
    prodotti = db.relationship("Prodotto")

    def json(self):
        return {'id': self.id, 'nome': self.nome}

    def add(nome):
        new_categoria = Categoria(nome=nome)
        db.session.add(new_categoria)
        db.session.commit()

    def get_all():
        return [Categoria.json(categoria) for categoria in Categoria.query.all()]

    def get(id):
        return [Categoria.json(Categoria.query.filter_by(id=id).first())]

    def update(id, nome):
        categoria_to_update = Categoria.query.filter_by(id=id).first()
        categoria_to_update.nome = nome
        db.session.commit()

    def delete(id):
        Categoria.query.filter_by(id=id).delete()
        db.session.commit()

@app.route('/categoria', methods=['POST'])
@jwt_required()
def categoria_create():
    if not request.json:
        return 'Missing json data', 400

    nome = request.json.get('nome')

    if not nome:
        return 'Missing "nome"', 400
    
    Categoria.add(nome)
    return 'Categoria added', 200

@app.route('/categoria', methods=['GET'])
@jwt_required()
def categoria_get():
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

    categorie = Categoria.get_all()[index:index + amount]

    if not categorie:
        return 'Categorie not found', 400
    
    return {'categorie':categorie}, 200

@app.route('/categoria', methods=['PUT'])
@jwt_required
def categoria_update():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')
    nome = request.json.get('nome')

    if not nome:
        return 'Missing "nome"', 400
    if not id:
        return 'Missing "id"', 400
    
    Categoria.update(id, nome)
    return 'Categoria added', 200

@app.route('/categoria', methods=['DELETE'])
@jwt_required()
def categoria_delete():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')

    if not id:
        return 'Missing "id"', 400

    categoria = Categoria.query.filter_by(id=id).first() 
    if not categoria:
        return 'Categoria not found', 400
    
    Categoria.delete(categoria.id)
    return 'Categoria removed', 200

from config import *
import json

class Magazzino(db.Model):
    __tablename__ = "magazzini"
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(20))
    indirizzo = db.Column(db.String(50))
    numero = db.Column(db.String(20))
    prodotti = db.relationship("Prodotto")

    def json(self):
        return {'id': self.id, 'nome': self.nome, 'indirizzo': self.indirizzo, 'numero referente': self.numero}

    def add(nome, indirizzo, numero):
        new_magazzino = Magazzino(nome=nome, indirizzo=indirizzo, numero=numero)
        db.session.add(new_magazzino)
        db.session.commit()

    def get_all():
        return [Magazzino.json(magazzino) for magazzino in Magazzino.query.all()]

    def get(id):
        return [Magazzino.json(Magazzino.query.filter_by(id=id).first())]

    def update(id, nome, indirizzo, numero):
        magazzino_to_update = Magazzino.query.filter_by(id=id).first()
        magazzino_to_update.nome = nome
        magazzino_to_update.indirizzo = indirizzo
        magazzino_to_update.numero = numero
        db.session.commit()

    def delete(id):
        Magazzino.query.filter_by(id=id).delete()
        db.session.commit()

@app.route('/magazzino', methods=['POST'])
@jwt_required()
def magazzino_create():
    if not request.json:
        return 'Missing json data', 400

    nome = request.json.get('nome')
    indirizzo = request.json.get('indirizzo')
    numero = request.json.get('numero')

    if not nome:
        return 'Missing "nome"', 400
    if not indirizzo:
        return 'Missing "indirizzo"', 400
    if not numero:
        return 'Missing "numero"', 400
    
    Magazzino.add(nome, indirizzo, numero)
    return 'Magazzino added', 200

@app.route('/magazzino', methods=['GET'])
@jwt_required()
def magazzino_get():
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

    magazzini = Magazzino.get_all()[index:index + amount]

    if not magazzini:
        return 'Magazzini not found', 400
    
    return {'magazzini':magazzini}, 200

@app.route('/magazzino', methods=['PUT'])
@jwt_required()
def magazzino_update():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')
    nome = request.json.get('nome')
    indirizzo = request.json.get('indirizzo')
    numero = request.json.get('numero')

    if not id:
        return 'Missing "id"', 400
    if not nome:
        return 'Missing "nome"', 400
    if not indirizzo:
        return 'Missing "indirizzo"', 400
    if not numero:
        return 'Missing "numero"', 400
    
    Magazzino.update(id, nome, indirizzo, numero)
    return 'Magazzino added', 200

@app.route('/magazzino', methods=['DELETE'])
@jwt_required()
def magazzino_delete():
    if not request.json:
        return 'Missing json data', 400

    id = request.json.get('id')

    if not id:
        return 'Missing "id"', 400

    magazzino = Magazzino.query.filter_by(id=id).first() 
    if not magazzino:
        return 'Magazzino not found', 400
    
    Magazzino.delete(magazzino.id)
    return 'Categoria removed', 200
from config import *
import bcrypt
import datetime

class Utente(db.Model):
    __tablename__ = "utenti"
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(20))
    cognome = db.Column(db.String(20))
    email = db.Column(db.String(100))
    password = db.Column(db.LargeBinary(20))

    def json(self):
        return {'id': self.id, 'nome': self.nome, 'cognome':self.cognome, 'email':self.email}

    def add(nome, cognome, email, password):
        new_utente = Utente(nome=nome, cognome=cognome, email=email, password=password)
        db.session.add(new_utente)
        db.session.commit()

    def get_all():
        return [Utente.json(utente) for utente in Utente.query.all()]

    def get(id):
        return [Utente.json(Utente.query.filter_by(id=id).first())]

    def update(id, nome, cognome, email, password):
        utente_to_update = Utente.query.filter_by(id=id).first()
        utente_to_update.nome = nome
        utente_to_update.cognome = cognome
        utente_to_update.email = email
        utente_to_update.password = password
        db.session.commit() 

    def delete(id):
        Utente.query.filter_by(id=id).delete()
        db.session.commit()

@app.route('/register', methods=['POST'])
def register():
    if not request.json:
        return 'Missing json data', 400

    email = request.json.get('email')
    nome =  request.json.get('nome')
    cognome =  request.json.get('cognome')
    password =  request.json.get('password')

    if not email:
        return 'Missing "email"', 400
    if not nome:
        return 'Missing "nome"', 400
    if not cognome:
        return 'Missing "cognome"', 400
    if not password:
        return 'Missing "password"', 400

    if Utente.query.filter_by(email=email).first():
        return 'Email already taken', 400

    hashed = bcrypt.hashpw(password.encode("utf-8"), bcrypt.gensalt())

    Utente.add(nome, cognome, email, hashed)
    
    expires = datetime.timedelta(minutes=60)
    access_token = create_access_token(identity={"email": email, "nome": nome, "cognome": cognome}, expires_delta=expires)

    response = {"access token": access_token}, 200
    return response

@app.route('/login', methods=['POST'])
def login():
    if not request.json:
        return 'Missing json data', 400
    
    email = request.json.get('email')
    password =  request.json.get('password')

    if not email:
        return 'Missing "email"', 400
    if not password:
        return 'Missing "password"', 400

    utente = Utente.query.filter_by(email=email).first()

    if bcrypt.checkpw(password.encode("utf-8"), utente.password):
        expires = datetime.timedelta(minutes=60)
        access_token = create_access_token(identity={"email": utente.email, "nome": utente.nome, "cognome": utente.cognome}, expires_delta=expires)
        response = {"access token": access_token}, 200
        return response
    return 'Invalid credentials', 200
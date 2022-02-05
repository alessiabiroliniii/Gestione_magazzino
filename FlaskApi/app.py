from Utente import *
from Categoria import *
from Magazzino import *
from Prodotto import *

if __name__ == "__main__":
    db.create_all()
    app.run(port=1234, debug=True)
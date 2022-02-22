class Utility {
  static const String sharedPreferencesToken = "token";
}

class ApiUtulity {
  static const String serverIp = "gestionemagazzino.pythonanywhere.com";

  // token
  static const String login = "/login"; // email, password
  static const String register = "/register"; // email, nome, cognome, password

  // product
  static const String productCreate =
      "/prodotto"; // nome, quantita, prezzo, data, categoria, magazzino
  static const String productGet = "/prodotto"; // index, amount
  static const String productDelete = "/prodotto"; // id
  static const String productUpdate =
      "/prodotto"; // id, nome, quantita, prezzo, data, categoria, magazzino

  // warehouse
  static const String warehouseCreate = "/magazzino"; // nome, indirizzo, numero
  static const String warehouseGet = "/magazzino"; // index, amount
  static const String warehouseDelete = "/magazzino"; // id NON VA
  static const String warehouseUpdate =
      "/magazzino"; // id, nome, indirizzo, numero

  // category
  static const String categoryCreate =
      "/categoria"; // nome POSSO INSERIRE LA STESSA CATEGORIA ALL'INFINITO
  static const String categoryGet = "/categoria"; // index, amount
  static const String categoryDelete = "/categoria"; // id NON VA
  static const String categoryUpdate = "/categoria"; // NON VA
}

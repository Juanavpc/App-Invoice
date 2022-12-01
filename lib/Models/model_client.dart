class Client{
  List<ModeloCliente> items = [];                          // Lista de clientes que se obtiene de la api  
  Client();                                                // Constructor
  
  
  Client.fromJsonList(List<dynamic> jsonList){            // Constructor con parámetro de tipo lista dinámica
    if(jsonList == null) return;                          // Si no hay datos, no hace nada
    for(var item in jsonList){
      final cliente = ModeloCliente.fromJsonMap(item);    // Crea un objeto de tipo ModeloCliente con los datos de la lista
      items.add(cliente);                                 // Agrega el objeto a la lista
    }
  }
}

class ModeloCliente{                                      // Clase que contiene los datos de un cliente
  late int Client_ID;
  late String Client_name;
  late String role;
  late String password;
  late String Email;

  ModeloCliente(                                          
    this.Client_ID,
    this.Client_name,
    this.role,
    this.password,
    this.Email
  );

  ModeloCliente.fromJsonMap(Map<String, dynamic> json){   // Constructor con parámetro de tipo mapa
    Client_ID=json['Client_ID'];
    Client_name=json['Client_name'];
    role=json['role'];
    password=json['password'];
    Email=json['Email'];
  }
}
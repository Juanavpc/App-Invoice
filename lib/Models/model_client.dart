class Client{
  List<ModeloCliente> items = [];
  
  Client();
  
  Client.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final cliente = new ModeloCliente.fromJsonMap(item);
      items.add(cliente);
    }
  }
}

class ModeloCliente{
  late int id;
  late String name;
  late String role;
  late String password;
  late String email;

  ModeloCliente(
    this.id,
    this.name,
    this.role,
    this.password,
    this.email,
  );

  ModeloCliente.fromJsonMap(Map<String, dynamic> json){
    id = json['Client_ID'];
    name = json['Client_name'];
    role = json['role'];
    password = json['password'];
    email = json['Email'];
  }

}
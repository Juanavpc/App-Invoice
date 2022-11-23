class Client{
  List<ModeloCliente> items = [];
  
  Client();
  
  Client.fromJsonList(List<dynamic> jsonList){
    if(jsonList == null) return;
    for(var item in jsonList){
      final cliente = ModeloCliente.fromJsonMap(item);
      items.add(cliente);
    }
  }
}

class ModeloCliente{
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

  ModeloCliente.fromJsonMap(Map<String, dynamic> json){
    Client_ID=json['Client_ID'];
    Client_name=json['Client_name'];
    role=json['role'];
    password=json['password'];
    Email=json['Email'];



  }

}
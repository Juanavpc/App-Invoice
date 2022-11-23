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
  late int id;
  late String email;
  late String username;
  late String password;
  late String firstname;
  late String lastname;
  late String city;
  late String street;
  late int number;
  late String zipcode;
  late String lat;
  late String long;
  late String phone;

  ModeloCliente(
    this.id,
    this.email,
    this.username,
    this.password,
    this.firstname,
    this.lastname,
    this.city,
    this.street,
  this.number,
    this.zipcode,
    this.lat,
    this.long,
    this.phone
  );

  ModeloCliente.fromJsonMap(Map<String, dynamic> json){
    id=json['id'];
    email=json['email'];
    username=json['username'];
    password=json['password'];
    firstname=json['name']['firstname'];
    lastname=json['name']['lastname'];
    city=json['address']['city'];
    street=json['address']['street'];
    zipcode=json['address']['zipcode'];
    lat=json['address']['geolocation']['lat'];
    long=json['address']['geolocation']['long'];
    phone=json['phone'];
    number=json['address']['number'];
  }

}
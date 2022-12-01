import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_invoice/Models/model_client.dart';

class ClientProvider {

  Future<List<ModeloCliente>> getClients() async {                      // Método que obtiene los clientes                

    final resp = await http.get(Uri.parse("http://localhost:5005/api/clients"));
    if(resp.statusCode == 200){
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);                             //se encarga de tomar el body en String y convertirlo a un json
      final client = Client.fromJsonList(decodedData);                  //se encarga de tomar el json y convertirlo a un objeto
      return client.items;                                              //retorna la lista de clientes
    }else{
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }

  Future<int> addClients( String name, String password, String email) async {   // Método que agrega un cliente
    Map data={  'Client_name': name,                                            //se crea un mapa con los datos del cliente
      'password': password,
      'Email': email
    };
    String body=jsonEncode(data);
    http.Response resp = await http.post(Uri.parse("http://localhost:5005/api/clients"),
    headers: {"Content-Type": "application/json"},body:body
    );
    print(resp.body.toString());
    return int.parse(resp.body);
  }
}


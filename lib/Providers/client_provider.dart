import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_invoice/Models/model_client.dart';

class ClientProvider {

  
  Future<List<ModeloCliente>> getClients() async {

    final resp = await http.get(Uri.parse("http://localhost:5005/api/clients"));
    if(resp.statusCode == 200){
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);      //se encarga de tomar el body en String y convertirlo a un json
      final client = Client.fromJsonList(decodedData);
      return client.items;

    }else{
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }
  Future<int> addClients( String name, String password, String email) async {
    Map data={  'Client_name': name,
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


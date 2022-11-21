import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_invoice/Models/model_client.dart';

class ClientProvider {
  final _url = "http://localhost:5005/api/clients";
  
  Future<List<ModeloCliente>> getClient() async {
    final resp = await http.get(Uri.parse(_url));
    if(resp.statusCode == 200){
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);                      //se encarga de tomar el body en String y convertirlo a un json
      final client = Client.fromJsonList(decodedData);
      print("los clientes $client");
      return client.items;
      

    }else{
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }
}


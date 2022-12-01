import 'dart:io';
import 'package:app_invoice/Models/model_Invoice_Details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class DetailsProvider {

  final _DetailsStreamController = StreamController<List<ModelInvoiceDetails>>.broadcast();     // StreamController que permite la comunicación entre el widget y el provider
  Function(List<ModelInvoiceDetails>) get DetailsSink => _DetailsStreamController.sink.add;     // Función que permite agregar datos al StreamController
  Stream<List<ModelInvoiceDetails>> get DetailsStream => _DetailsStreamController.stream;       // Stream que permite obtener los datos del StreamController

  void disposeStreams(){                                                                        // Método que cierra el StreamController                  
    _DetailsStreamController.close(); 
  }

  Future<List<ModelInvoiceDetails>> getDetails(int invoice_ID) async {                          // Método que obtiene los detalles de una factura
    final resp = await http.get(Uri.parse("http://localhost:5005/api/details/$invoice_ID"));
    if(resp.statusCode == 200){
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);      //se encarga de tomar el body en String y convertirlo a un json
      final details = InvoiceDetails.fromJsonList(decodedData);
      DetailsSink(details.items);
      return details.items;

    }else{
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }


  Future<String> addDetails( List items, int  invoice_ID) async {                               // Método que agrega un detalle a una factura
    Map data={  'items': jsonEncode(items) };                                                   //se crea un mapa con los datos del detalle
    String body=jsonEncode(data);
    http.Response resp = await http.post(Uri.parse("http://localhost:5005/api/details/$invoice_ID"),
        headers: {"Content-Type": "application/json"},body:body
    );
    print(resp.body.toString());
    return resp.statusCode.toString();
  }



}


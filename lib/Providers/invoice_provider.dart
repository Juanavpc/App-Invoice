import 'dart:io';

import 'package:app_invoice/Models/model_invoice.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';


class InvoiceProvider {

  final _InvoicesStreamController = StreamController<List<ModelInvoice>>.broadcast();
  Function(List<ModelInvoice>) get InvoicesSink => _InvoicesStreamController.sink.add;
  Stream<List<ModelInvoice>> get productsStream => _InvoicesStreamController.stream;

  void disposeStreams(){
    _InvoicesStreamController.close();
  }



  Future<List<ModelInvoice>> getInvoicesClient(int id) async {

    final resp = await http.get(Uri.parse("http://localhost:5005/api/invoice_one/${id}"));
    if(resp.statusCode == 200){
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);      //se encarga de tomar el body en String y convertirlo a un json
      final invoice = Invoice.fromJsonList(decodedData);
      InvoicesSink(invoice.items);
      return invoice.items;

    }else{
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }
  Future<int> addInvoice( int Client_ID, String date_, int discount, int subtotal, int total ) async {
    Map data={  'Client_ID': Client_ID,
      'date_': date_,
      'discount': discount,
      'subtotal':subtotal,
      'total':total
    };
    String body=jsonEncode(data);
    http.Response resp = await http.post(Uri.parse("http://localhost:5005/api/invoice"),
        headers: {"Content-Type": "application/json"},body:body
    );
    print('${resp.body}');
    return int.parse(resp.body);
  }



}

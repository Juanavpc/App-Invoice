import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_invoice/Models/model_products.dart';

class ProductProvider {


  final _ProductsStreamController = StreamController<List<ModelProduct>>.broadcast();
  Function(List<ModelProduct>) get productsSink => _ProductsStreamController.sink.add;
  Stream<List<ModelProduct>> get productsStream => _ProductsStreamController.stream;

  void disposeStreams(){
    _ProductsStreamController.close();
  }

  Future<List<ModelProduct>> getProducts() async {
    final resp = await http.get(Uri.parse("http://localhost:5005/api/products"));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body); //se encarga de tomar el body en String y convertirlo a un json
      final product = Product.fromJsonList(decodedData);
      productsSink(product.items);
      return product.items;
    } else {
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }

  Future<List<ModelProduct>> getProductsByCategory(String category) async {
    final resp = await http.get(Uri.parse("http://localhost:5005/api/products/$category"));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body); //se encarga de tomar el body en String y convertirlo a un json
      final product = Product.fromJsonList(decodedData);
      productsSink(product.items);
      return product.items;
    } else {
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }
}

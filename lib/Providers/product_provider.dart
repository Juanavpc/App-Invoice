import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:app_invoice/Models/model_products.dart';

class ProductProvider {


  final _ProductsStreamController = StreamController<List<ModelProduct>>.broadcast();     // StreamController que permite la comunicación entre el widget y el provider
  Function(List<ModelProduct>) get productsSink => _ProductsStreamController.sink.add;    // Función que permite agregar datos al StreamController
  Stream<List<ModelProduct>> get productsStream => _ProductsStreamController.stream;      // Stream que permite obtener los datos del StreamController

  void disposeStreams(){                                                                  // Método que cierra el StreamController                    
    _ProductsStreamController.close();
  }

  Future<List<ModelProduct>> getProducts() async {                                        // Método que obtiene los productos     
    final resp = await http.get(Uri.parse("http://localhost:5005/api/products"));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body);                                               //se encarga de tomar el body en String y convertirlo a un json
      final product = Product.fromJsonList(decodedData);
      productsSink(product.items);                                                        // Se envían los datos al StreamController                
      return product.items;
    } else {
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }

  Future<List<ModelProduct>> getProductsByCategory(String category) async {               // Método que obtiene los productos por categoría
    final resp = await http.get(Uri.parse("http://localhost:5005/api/products/$category"));
    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final decodedData = jsonDecode(body); 
      final product = Product.fromJsonList(decodedData);
      productsSink(product.items);
      return product.items;
    } else {
      throw Exception("Ocurrió algo  ${resp.statusCode}");
    }
  }
}

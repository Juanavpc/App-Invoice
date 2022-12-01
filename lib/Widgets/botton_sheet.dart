import 'dart:async';
import 'package:app_invoice/Pages/Cart_Page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBottomSheet extends StatefulWidget {
  int id;
  String name;
  int price;
  String img;
  String desc;
  List listProductCart;

  CustomBottomSheet(this.id, this.name, this.price, this.img, this.desc,
      this.listProductCart);

  @override
  _CustomBottomSheet createState() =>
      _CustomBottomSheet(id, name, price, img, desc, listProductCart);
}

class _CustomBottomSheet extends State<CustomBottomSheet> {
  int id;
  String name;
  int price;
  String img;
  String desc;
  List listProductCart;
  Map product = {};


  Map productwithcounter = {};

  _CustomBottomSheet(this.id, this.name, this.price, this.img, this.desc,
      this.listProductCart);
  int counter = 1;
  int number = 1;
  int total = 0;
  int total_compra=0;
  final StreamController<int> streamController = new StreamController<int>();       // StreamController que permite la comunicación entre el widget y el provider
  final StreamController<List> itemsController = new StreamController<List>();      // StreamController que permite la comunicación entre el widget y el provider
  
  @override
  void initState() {                                      // Método que se ejecuta al iniciar el widget
    super.initState();
    total = price;
  }

  @override
  void dispose() {                                        // Método que se ejecuta al cerrar el widget            
    super.dispose();
    streamController.close();                             // Cierra el StreamController      
  }

  void addProductCart(Map product) {                      // Método que agrega un producto al carrito
    setState(() {                                         // Método que permite actualizar el estado del widget  
      listProductCart.add(product);                       // Agrega el producto al carrito
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 223, 221, 221),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Text(
                "Total: ",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 30),
              InkWell(
                onTap: () {
                  streamController.sink.add(--counter);         // Disminuye el contador
                  setState(() {                                 // Método que permite actualizar el estado del widget
                    if (counter == 0) {             
                      total = price * 1;
                    } else {
                      total = price * counter;
                    }
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    CupertinoIcons.minus,
                    size: 18,
                    color: Colors.redAccent,
                  ),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              StreamBuilder(
                initialData: 1,                                 // Valor inicial del StreamBuilder
                stream: streamController.stream,                // Stream que permite la comunicación entre el widget y el provider
                builder: (context, snapshot) {                  // Método que permite construir el widget
                  if (snapshot.data! >= 1) {
                    number = snapshot.data!;
                  } else {
                    counter = 1;
                    number = 1;
                  }
                  return Text(
                    "${number}",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  );
                },
              ),
              SizedBox(
                width: 8,
              ),
              InkWell(
                onTap: () {
                  streamController.sink.add(++counter);           // Aumenta el contador
                  setState(() {
                    total = price * counter;
                  });
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Color(0xFFF7F8FA),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    CupertinoIcons.add,
                    size: 18,
                    color: Colors.redAccent,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payment:",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "\$${total}.000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ],
          ),
          SizedBox(height: 30),
          InkWell(
            onTap: () {

              var exist = false;                      
              late int itemPosition;                                              // Variable que almacena la posición del producto en el carrito

              for (var map in listProductCart) {                                  // Ciclo que recorre el carrito
                if (map['product']['Product_ID'].toString() == id.toString()) {   // Condición que verifica si el producto ya existe en el carrito
                  exist = true;
                  itemPosition = listProductCart.indexOf(map);                    // Asigna la posición del producto en el carrito
                }

              }

              if (exist) {                                                                                            // Condición que verifica si el producto ya existe en el carrito
                listProductCart[itemPosition]['quantity'] = listProductCart[itemPosition]['quantity'] + counter;      // Aumenta la cantidad del producto en el carrito
                listProductCart[itemPosition]['total'] = listProductCart[itemPosition]['total'] + total;              // Aumenta el total del producto en el carrito
              } else {
                product = {                                                                                           // Objeto que almacena los datos del producto                  
                  'Product_ID': id,
                  'Product_name': name,
                  'Product_descr': desc,
                  'Price': price,
                  'image': img
                };

                productwithcounter = {
                  'product': product,
                  'quantity': counter,
                  'total': price * counter
                };

                product.addAll(product);                                                                    // Agrega los datos del producto al carrito
                productwithcounter.addAll(productwithcounter);                                              // Agrega los datos del producto con la cantidad y el total al carrito
                addProductCart(productwithcounter);                                                         // Agrega el producto al carrito
              }
              total_compra=0;
              for (var map in listProductCart) {                                                            // Ciclo que recorre el carrito
                total_compra=map['total']+total_compra;                                                     // Suma el total de los productos en el carrito
              }
              print("el total de la compra es ${total_compra}");

              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(listProductCart,total_compra),
                  ));
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
              decoration: BoxDecoration(
                color: Color(0XFFFD725A),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                "Add to cart",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

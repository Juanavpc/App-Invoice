import 'package:app_invoice/Widgets/Cart_Items.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  List items;                                                    // Lista de productos que se obtiene de la api
  int total_compra;

  CartPage(this.items, this.total_compra);                       // Constructor

  @override
  _CartPage createState() =>_CartPage(items, total_compra);      // Constructor de la clase
}

class _CartPage extends State<CartPage> {
  List items;
  int total_compra;
  _CartPage(this.items, this.total_compra);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 22,
                        ),
                      ),
                      Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.more_horiz,
                          size: 30,
                        ),
                      )
                    ]),
              ),
              Container(
                  padding: EdgeInsets.only(top: 15),
                  child: CartItems(items, total_compra)),
            ],
          ),
        ),
      ),
    );
  }
}

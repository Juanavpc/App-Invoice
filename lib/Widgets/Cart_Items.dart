import 'dart:async';

import 'package:app_invoice/Providers/details_provider.dart';
import 'package:app_invoice/Providers/invoice_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Pages/Home_Page.dart';

class CartItems extends StatefulWidget {
  List items;
  int total_compra;

  CartItems(this.items,this.total_compra);
  @override
  _CartItems createState() => _CartItems(items,total_compra);
}

class _CartItems extends State<CartItems> {
  List items;
  int total_compra;

  _CartItems(this.items,this.total_compra);

  int counter = 1;
  int discount=0;
  int totalPayment=0;
  int id=0;
  final now = DateTime.now();



  @override
  void initState() {
    super.initState();
    if(items.length>2){                         //si hay mas de 2 items en el carrito               
      discount=3;                               //se aplica un descuento del 3%                  
    }
    setState(() {
      totalPayment=(total_compra-(total_compra*(discount/100))).toInt();        //se calcula el total a pagar
    });
    getCred();
    String formatter = DateFormat('yMd').format(now);                           //se obtiene la fecha actual
    print(formatter);
  }

  void getCred() async {                                                         //se obtiene el id del cliente
    SharedPreferences pref = await SharedPreferences.getInstance();   
    setState(() {
      id= pref.getInt("login_id")!;
    });
    print("el usuario es:${id}");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(children: items
            .map((item) =>
            Container(
          height: 110,
          margin:
          const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                height: 70,
                width: 70,
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 224, 244),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.network(item['product']['image']),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${item['product']['Product_name']}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.7),
                      ),
                    ),
                    Text(
                      "Ref ${item['product']['Product_ID']}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                    Text(
                      "\$${item['total']}.000",
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFD725A),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete,
                            color: Colors.redAccent),
                        onPressed: () {
                          setState(() {
                            items.remove(item);
                            total_compra=(item['total']-total_compra)*-1;
                            totalPayment=(total_compra-(total_compra*(discount/100))).toInt();

                          });
                        },
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (item['quantity'] >= 1) {
                                item['quantity'] = item['quantity'] - 1;

                              }if (item['quantity'] <= 0){
                                item['quantity']=1;
                              }
                              total_compra=0;

                              setState(() {
                                if(item['quantity']>=1){
                                  item['total'] = item['product']['Price'] * item['quantity'];
                                  for(var map in items){
                                    total_compra=map['total']+total_compra;
                                    print("entro alhgo ${total_compra}");
                                  }
                                  totalPayment=(total_compra-(total_compra*(discount/100))).toInt();
                                  print("el total de compra es: ${total_compra}");
                                }
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                CupertinoIcons.minus,
                                size: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(
                            "${item['quantity']}",
                            style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          InkWell(
                            onTap: () {
                              item['quantity'] = item['quantity'] + 1;
                              setState(() {
                                item['total'] = item['product']['Price'] * item['quantity'];
                                total_compra=item['product']['Price'] +total_compra;
                                totalPayment=(total_compra-(total_compra*(discount/100))).toInt();
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Color(0xFFF7F8FA),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(
                                CupertinoIcons.add,
                                size: 18,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        )).toList()),

        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Discount:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.8)),
              ),
              Text(
                "${discount}%",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Subtotal:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.8)),
              ),
              Text(
                "\$${total_compra}.000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total Payment:",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.8)),
              ),
              Text(
                "\$${totalPayment}.000",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.red.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 30,
        ),
        InkWell(
          onTap: () {
            getCred();

            AddInvoice();
            items.removeRange(0, items.length+1);
            totalPayment=0;
            total_compra=0;
            discount=0;

          },
          child: Container(
            padding:
            EdgeInsets.symmetric(vertical: 20, horizontal: 130),
            decoration: BoxDecoration(
              color: Color(0XFFFD725A),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              "Checkout",
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.white.withOpacity(0.9),
              ),
            ),
          ),
        )

      ],
    );
  }

  void AddInvoice() async{                                                  //Agrega la factura a la base de datos
    String formatter = DateFormat('yMd').format(now);

    final getprovider = InvoiceProvider();
    final getprovider2= DetailsProvider();
    var response=await getprovider.addInvoice(id, formatter, discount, total_compra, totalPayment);
    await getprovider2.addDetails(items, response);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);

  }


}

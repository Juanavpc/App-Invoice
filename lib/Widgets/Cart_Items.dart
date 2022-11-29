import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CartItems extends StatefulWidget{
  List items;

  CartItems(this.items);
  @override

  _CartItems createState()=>_CartItems(items);

}
class _CartItems extends State<CartItems> {
  List items;

  _CartItems(this.items);

  int counter=1;


  @override
  Widget build(BuildContext context) {
    return Column(

      children: items.map((item) =>

          Container(
            height: 110,
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                          icon:const Icon(Icons.delete,color: Colors.redAccent),
                          onPressed: () { setState(() {
                            items.remove(item);
                          }); },

                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: (){

                                if(item['quantity']>=1){
                                  item['quantity']=item['quantity']-1;
                                }

                                setState(() {
                                if (item['quantity']==0){
                                  item['total']= item['product']['Price'] * 1;
                                }else{
                                  item['total']= item['product']['Price']  * item['quantity'];

                                }});
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
                              )
                              ,
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
                            )
                            ,

                            const SizedBox(
                              width: 8,
                            ),
                            InkWell(
                              onTap: (){

                                item['quantity']=item['quantity']+1;
                                setState(() {
                                  item['total']= item['product']['Price'] * item['quantity'];
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
                            )
                            ,

                          ],
                        )
                      ],
                    ))

              ],
            ),
          )

      ).toList()
    );
  }
}

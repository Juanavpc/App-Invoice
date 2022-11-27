import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  List items;

  CartItems(this.items);


  @override
  Widget build(BuildContext context) {
    return Column(

      children: items.map((item) =>
          Container(
            height: 110,
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 224, 224, 244),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Image.network(item['product']['image']),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
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
                        style: TextStyle(
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
                        Icon(
                          Icons.delete,
                          color: Colors.redAccent,
                        ),
                        Row(
                          children: [
                            Container(
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
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              "${item['quantity']}",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Container(
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

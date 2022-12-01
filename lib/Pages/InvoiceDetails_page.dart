import 'package:app_invoice/Pages/Home_Page.dart';
import 'package:app_invoice/Widgets/details_items.dart';
import 'package:flutter/material.dart';

import '../Models/model_invoice.dart';
import '../Providers/details_provider.dart';

class Details extends StatelessWidget{
  final ModelInvoice invoice;

   Details({Key? key,required this.invoice}): super(key: key);
  final getProvider1 = DetailsProvider();
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    getProvider1.getDetails(invoice.Invoice_ID);
    double h= MediaQuery.of(context).size.height;
    double w=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 80, left: 20, right: 20),
        height: h,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("../assets/paymentbackground.png")
          )
        ),
        child: Column(
          children: [
            Container(
              width: double.maxFinite,
              height: h*0.14,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fitWidth,
                        image: AssetImage("../assets/success.png")
                    )
                )
            ),
            Text(
              "Invoice No. ${invoice.Invoice_ID}", style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black
            ),
            ),
            Text(
              "Date: ${invoice.date_}", style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.grey
            ),
            ),
            SizedBox(height: h*0.045,),
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                height: 160,
                width: 350,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2,
                        color: Colors.grey.withOpacity(0.5)
                    )
                ),
                child: SingleChildScrollView(
                  child: ContentStreamDetails(getProvider1),
                ),
            ),),
            SizedBox(height: h*0.05,),
            Column(
              children: [
                Text(
                  "Total Amount",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey
                  ),


                ),
                SizedBox(height: 10,),
                Text(
                  "\$${invoice.total}.000",
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black
                  ),),

                SizedBox(height: h*0.14,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrangeAccent,

                          ),
                          child: Icon(
                            Icons.share_sharp, size: 30,color: Colors.white,
                          )

                      ),
                    ),
                    SizedBox(width: 80,),
                    GestureDetector(
                      onTap: (){},
                      child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.deepOrangeAccent,

                          ),
                          child: Icon(
                            Icons.print_outlined, size: 30, color: Colors.white,
                          )

                      ),
                    )
                  ],
                ),
                SizedBox(height: h*0.02,),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
                    },
                  child: Container(
                    padding:
                    EdgeInsets.symmetric(vertical: 20, horizontal: 130),
                    decoration: BoxDecoration(
                      color: Color(0XFFFD725A),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      "Done",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ),
                )
              ],
            )

          ],
        ),
      ),

    );
  }
}
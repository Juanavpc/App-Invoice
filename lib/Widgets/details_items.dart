import 'package:app_invoice/Models/model_Invoice_Details.dart';
import 'package:app_invoice/Models/model_invoice.dart';
import 'package:app_invoice/Providers/details_provider.dart';
import 'package:app_invoice/Providers/invoice_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/InvoiceDetails_page.dart';


Widget ContentInvoices(List<ModelInvoiceDetails> data){
  double count= data.length+1-1 ;


  return  Column(
    children: data.map((item) =>
        Container(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top:15,left: 20, bottom: 10),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.green
                    ),
                    child: Icon(Icons.done,size: 30, color: Colors.white,),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("${item.Product_name}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Color(0xFFFD725A)),),
                      SizedBox(height: 10,),
                      Text("Cant: ${item.Quantity}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey)),


                    ],
                  ),
                  SizedBox(width: 20,),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "\$${item.Total}.000",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.black),
                      )
                    ],
                  ),

                ],

              ),
              Divider(thickness: count,color: Colors.grey.withOpacity(0.5),)
            ],
          ),
        ),



    ).toList(),
  );

}



Widget ContentStreamDetails(DetailsProvider getProvider1){
  return StreamBuilder(
      stream: getProvider1.DetailsStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData){
          return ContentInvoices(snapshot.data as List<ModelInvoiceDetails>);
        }else{
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFFD725A)), //el color del simbolo de carga

            ),
          );
        }
      }
  );
}
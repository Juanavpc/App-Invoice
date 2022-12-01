import 'package:app_invoice/Models/model_invoice.dart';
import 'package:app_invoice/Providers/invoice_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Pages/InvoiceDetails_page.dart';


Widget ContentInvoices(List<ModelInvoice> data,context){


   return  Column(
        children: data.map((item) =>
            Padding(
                padding:EdgeInsets.only(bottom: 13),
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width-20,
                  decoration:  const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30)
                      ),
                      boxShadow: [BoxShadow(
                        color: Color(0xFFd8dbe0),
                        offset: Offset(1,1),
                        blurRadius: 20.0,

                      )]
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 10,left: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 60,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          width: 3,
                                          color: Colors.grey

                                      ),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage("../assets/cover.jpg")
                                      )
                                  ),
                                ),
                                SizedBox(width: 10,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Shopping App",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:Color(0xFFFD725A),
                                          fontWeight: FontWeight.w700
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text("ID: 000${item.Invoice_ID}",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color:Colors.grey,
                                          fontWeight: FontWeight.w500
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Container(
                              child: Column(

                                children: const [
                                  Text("Entregado",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color(0XFF76FF03),
                                        fontWeight: FontWeight.w500
                                    ),
                                    maxLines: 1,
                                    softWrap: false,
                                    overflow: TextOverflow.clip,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 5,)
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 13),
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: (){
                                      Navigator.push(//El método push agregará una Route a la pila de rutas administradas por el Navigator
                                          context,
                                          MaterialPageRoute(
                                          builder: (context)=>Details(invoice:item),));
                                    },
                                    child: Container(
                                        width: 80,
                                        height: 30,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Color.fromARGB(255, 224,224 ,224),

                                        ),
                                        child: Center(
                                          child: Text(
                                            "Select",
                                            style: TextStyle(
                                                fontSize: 16,
                                                color: Colors.grey
                                            ),
                                          ),
                                        )
                                    ),
                                  ),
                                  Expanded(
                                      child:Container()
                                  ),
                                  Text(
                                    "\$${item.total}.000",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900,

                                    ),
                                  ),
                                  Text(
                                    "${item.date_}",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w700,

                                    ),
                                  ),
                                  SizedBox(height: 10,)
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),

                  ),
                )
            )


        ).toList(),);

}



Widget ContentStreamInvoices(InvoiceProvider getProvider1, _context){
  return StreamBuilder(
      stream: getProvider1.productsStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData){
          return ContentInvoices(snapshot.data as List<ModelInvoice>,_context);
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
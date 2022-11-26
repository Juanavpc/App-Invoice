import 'package:app_invoice/Providers/product_provider.dart';
import 'package:flutter/material.dart';

import '../Models/model_products.dart';
import 'Product_Card.dart';

Widget ContentProducts (List<ModelProduct> data,context){
  return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: (MediaQuery.of(context).size.width-30-15)/(2*290),
          mainAxisSpacing: 45,
          crossAxisSpacing: 15
      ),
      itemBuilder: (_,i){
        if(i%2==0){
          return ProductCard(data[i].Product_ID,data[i].Product_name,data[i].Price,data[i].image,data[i].Product_descr);
        }
        return OverflowBox(
          maxHeight: 290.0 +70.0,
          child: Container(
            margin: EdgeInsets.only(top: 70),
            child: ProductCard(data[i].Product_ID,data[i].Product_name,data[i].Price,data[i].image,data[i].Product_descr),
          ),
        );
      },
    itemCount: data.length,
  );
}

Widget ContentStreamProducts(ProductProvider productprovider){
  return StreamBuilder(
    stream: productprovider.productsStream,
      builder: (BuildContext context, AsyncSnapshot<List> snapshot){
        if (snapshot.hasData){
          return ContentProducts(snapshot.data as List<ModelProduct>,context);
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
  );
}


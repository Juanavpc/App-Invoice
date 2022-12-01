import 'package:flutter/material.dart';
import '../Pages/ProductDetails.dart';

class ProductCard extends StatelessWidget{
  int id;
  String name;
  int price;
  String img;
  String desc;
  
  List listProductCart;

  ProductCard(this.id,this.name,this.price,this.img,this.desc, this.listProductCart);


  @override
  Widget build(BuildContext context){
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Container(
            color: Color.fromARGB(255, 224,224 ,224),
            child: Stack(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(id,name,price,img,desc, listProductCart)));
                  },
                  child: Image.network(img, fit: BoxFit.cover,height: 230,),
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Color(0xFFF7F8FA),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.favorite, color: Colors.red, size: 20,),
                        onPressed: (){
                        },
                        
                      ),
                    ),
                  ),

                )
              ],
            ),
          ),
        ),

        SizedBox(height: 10,),
        Padding(
            padding: EdgeInsets.only(left: 5),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    color:Colors.black.withOpacity(0.7)
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  "\$${price}.000",
                  style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w500,
                      color:Colors.red.withOpacity(0.7)
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
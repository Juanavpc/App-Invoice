import 'dart:js_util';
import 'package:app_invoice/Pages/Login_Page.dart';
import 'package:app_invoice/Providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/ContentProduct.dart';
import '../Widgets/DiscountCard.dart';
import '../Widgets/SearchField.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectIndex = 0;
  String user = "";
  List catList=["All","Electronicos", "Hogar","Joyeria", "Ropa"];
  final productProvider = ProductProvider();
  String _currentElection = "All";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }

  void getCred() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      user = pref.getString("login")!;
    });
  }

  void onTapped(int index){
    setState(() {
      _selectIndex = index;
    });
  }

  void onElection(String value){
    setState(() {
      _currentElection = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_currentElection == "All"){
      productProvider.getProducts();
    }
    return Scaffold(
      backgroundColor: Colors.grey,
     body: SingleChildScrollView(
       child: SafeArea(
         child: Padding(
           padding: EdgeInsets.only(top:20,left: 15),
           child: Column(
             children: [
               Padding(
                   padding: EdgeInsets.only(right: 25),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Container(
                       width: MediaQuery.of(context).size.width/1.5,
                       decoration: BoxDecoration(
                         color:Color(0xFFF7F8Fa),
                         borderRadius: BorderRadius.circular(10),
                       ),
                       child: TextFormField(
                         decoration: InputDecoration(
                           label: Text("Find your product"),
                           border: InputBorder.none,
                           prefixIcon:  Icon(
                             Icons.search,
                             size: 30,
                             color: Colors.grey,
                           )
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.all(15),
                       decoration: BoxDecoration(
                         color: Color(0xFFF7F8FA),
                         borderRadius: BorderRadius.circular(10),

                       ),
                       child: Icon(
                         Icons.notifications_none,
                         size: 30,
                         color:Colors.grey
                       ),
                     )
                   ],
                 ),

               ),
               Container(
                 margin: EdgeInsets.only(right: 25,top:20),
                 alignment:Alignment.center,
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(30),
                    child: Image.asset("cover.jpg",
                    width: MediaQuery.of(context).size.width/1.2,
                      fit: BoxFit.contain,
                    ),
                 ),
               ),
               SingleChildScrollView(
                 scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: EdgeInsets.only(top:25),
                    child: Row(
                      children: [
                        for(int i=0;i<catList.length;i++)
                          Container(                                 //deben de ser botones o selecciones que permitan ir a a otra pagina
                            margin: EdgeInsets.all(8),
                            padding: EdgeInsets.symmetric(
                              vertical: 10,horizontal: 18
                            ),
                            decoration: BoxDecoration(color:catList[i]==_currentElection?
                            Color(0xFFFD725A):
                                Color(0xFFF7F8FA),
                              borderRadius: BorderRadius.circular(18)
                            ),
                            child: TextButton(
                              child: Text(
                                catList[i],
                                style: TextStyle(fontSize: 16,
                               color:catList[i]==_currentElection?
                               Colors.white:
                               Colors.grey,),
                              ),
                              onPressed: () {
                                if(catList[i]=="All"){
                                  onElection("All");
                                  productProvider.getProducts();
                                }else{
                                  onElection(catList[i]);
                                  productProvider.getProductsByCategory(catList[i]);
                                }
                              },
                            ),
                          )
                      ],
                    ),
                  ),
               ),
               ContentStreamProducts(productProvider)
             ],
           ),
         ),
       ),
     ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        iconSize: 30,
        selectedItemColor: Color(0xFFFD725A),
        unselectedItemColor: Colors.grey ,
        currentIndex: 0,
        onTap: (index){},
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart_fill),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFD725A),
        onPressed: (){},
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}
/*RichText(
            textAlign: TextAlign.left,
            text: TextSpan( 
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
              children: <TextSpan>[
                new TextSpan(text: 'Hello, Welcome\n', style: new TextStyle(color: Colors.black)),
                new TextSpan(text: user, style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),*/
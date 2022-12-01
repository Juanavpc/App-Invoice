import 'package:app_invoice/Pages/Cart_Page.dart';
import 'package:app_invoice/Providers/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Widgets/ContentProduct.dart';
import 'Login_Page.dart';
import 'invoice_page.dart';
import 'package:intl/intl.dart';

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
  List listProductCart = [];
  int total_compra=0;
  int id=0;






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
      id= pref.getInt("login_id")!;

    });
    print("en el home page el id es: ${id}");
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

  void addProductCart(Map product){
    setState(() {
      listProductCart.add(product);
    });
  }
  void addTotalCompra(){
    total_compra=0;
    setState(() {
      listProductCart.map((e) =>
      total_compra=e['total']+total_compra
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_currentElection == "All"){
      productProvider.getProducts();
    }
    return Scaffold(

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
                   RichText(
                   textAlign: TextAlign.left,
                   text: TextSpan(
                     style: new TextStyle(
                       fontSize: 15.0,
                       color: Colors.white,
                     ),
                     children: <TextSpan>[
                       new TextSpan(text: 'Hello, Welcome 👋\n', style: new TextStyle(color: Colors.black)),
                       new TextSpan(text: user, style: new TextStyle(fontWeight: FontWeight.bold, color: Colors.black)),
                     ],
                   ),
                 ),
                     InkWell(
                       onTap: () async{
                         SharedPreferences pref=await SharedPreferences.getInstance();
                         await pref.clear();
                         Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);

                       },
                       child: Container(
                         padding: EdgeInsets.all(15),
                         decoration: BoxDecoration(
                           color: Color(0xFFF7F8FA),
                           borderRadius: BorderRadius.circular(10),

                         ),
                         child: Icon(
                             Icons.logout_outlined,
                             size: 30,
                             color:Colors.grey
                         ),
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
                          Container(
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
               ContentStreamProducts(productProvider, listProductCart),

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
        currentIndex: _selectIndex,
        onTap: (int index){
          if(index == 0){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
          }else if(index == 1){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage(listProductCart,total_compra)));
          }
        },
        //onTap: (index){
        //},
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: ''),
          BottomNavigationBarItem(icon: Icon(CupertinoIcons.cart_fill),label: ''),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFD725A),
        child: const Icon(Icons.library_books),
        onPressed: (){
          getCred();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>InvoicePage(id)));


        },
      ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

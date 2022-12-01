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
  void initState() {                           // Método que se ejecuta al iniciar el widget
    super.initState();
    getCred();
  }

  void getCred() async {                       // Método que obtiene el nombre del usuario
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      user = pref.getString("login")!;
      id= pref.getInt("login_id")!;

    });
  }

  void onTapped(int index){                     // Método que cambia el índice de la barra de navegación
    setState(() {
      _selectIndex = index;
    });
  }

  void onElection(String value){                // Método que cambia el valor de las categorías de productos
    setState(() {
      _currentElection = value;
    });
  }

  void addProductCart(Map product){             // Método que agrega un producto al carrito
    setState(() {
      listProductCart.add(product);
    });
  }
  void addTotalCompra(){                        // Método que suma el total de la compra
    total_compra=0;
    setState(() {
      listProductCart.map((e) =>                // Recorre la lista de productos del carrito
      total_compra=e['total']+total_compra
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    if(_currentElection == "All"){                    // Si la categoría es "All" se muestran todos los productos
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
                                if(catList[i]=="All"){                            // Si la categoría es "All" se muestran todos los productos
                                  onElection("All");
                                  productProvider.getProducts();
                                }else{                                            // Si la categoría es diferente a "All" se muestran los productos de la categoría seleccionada
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
               ContentStreamProducts(productProvider, listProductCart),           // Widget que muestra los productos

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

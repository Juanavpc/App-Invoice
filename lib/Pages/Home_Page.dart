import 'dart:js_util';
import 'package:app_invoice/Pages/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SearchField(),
                      Spacer(),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 238, 238, 238),
                              ),
                              child: Icon(Icons.shopping_cart),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 238, 238, 238),
                              ),
                              child: Icon(Icons.notifications),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () async {
                          SharedPreferences pref =
                              await SharedPreferences.getInstance();
                          await pref.clear();
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()),
                              (route) => false);
                        },
                        borderRadius: BorderRadius.circular(50),
                        child: Stack(
                          children: [
                            Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 238, 238, 238),
                              ),
                              child: Icon(Icons.logout),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 15),
          DiscountBanner(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favorite",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: "Bag",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
        currentIndex: _selectIndex,
        selectedItemColor: Color.fromARGB(255, 201, 185, 231),
        unselectedItemColor: Colors.grey,
        onTap: onTapped,
      ),
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
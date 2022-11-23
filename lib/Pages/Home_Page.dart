import 'package:app_invoice/Pages/Login_Page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String user="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCred();
  }
  void getCred() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      user=pref.getString("login")!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SafeArea(child: Center(child:Column(
            children: [
              Text("Welcome ${user}"),
              SizedBox(height: 35,),
              OutlinedButton.icon(onPressed: ()async{
                SharedPreferences pref =await SharedPreferences.getInstance();
                await pref.clear();
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>LoginPage()), (route) => false);
              },
              icon: Icon(Icons.login),
                label: Text("Logout"),
              )
            ],

        ),),),
      ),
    );
  }
}
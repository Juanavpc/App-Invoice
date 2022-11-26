import 'package:flutter/material.dart';
import 'package:app_invoice/Pages/Login_Page.dart';
import 'package:app_invoice/Pages/Register_Page.dart';
import 'package:app_invoice/Pages/Home_Page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Invoice App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => LoginPage(),
        '/register':(context) => RegisterPage(),
        '/home':(context) => HomePage()
      },
    
    );
  }
}
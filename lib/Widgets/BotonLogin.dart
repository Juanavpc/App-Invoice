import 'package:flutter/material.dart';

Widget _botonLogin(){
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot){
      return ElevatedButton(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
          child: Text("Login", style: TextStyle(fontSize: 16),),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5)
          ),
          elevation: 8,
          textStyle: TextStyle(color: Colors.white),
        ), 
        onPressed: (){},
      );
    }
  );
}
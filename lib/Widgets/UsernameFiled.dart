import 'package:app_invoice/Providers/client_provider.dart';
import "package:flutter/material.dart";

Widget _UsernameField(BuildContext context, ClientProvider clientProvider) {
  return StreamBuilder(
      builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    return TextFormField(
      //controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.person, color: Colors.deepPurple),
        hintText: "Username",
      ),
    );
  });
}

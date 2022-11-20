import "package:flutter/material.dart";

Widget _PasswordField() {
  return StreamBuilder(
    builder: (BuildContext context, AsyncSnapshot snapshot) {
    return TextFormField(
      //controller: _passwordController,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Colors.deepPurple),
        hintText: "Password",
      ),
    );
  });
}

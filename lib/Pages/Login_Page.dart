import 'package:flutter/material.dart';
import 'package:app_invoice/Providers/client_provider.dart';
import 'package:app_invoice/Models/model_client.dart';
import 'package:http/http.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final clientprovider = ClientProvider();

  @override
  void initState() {
    super.initState();
    final getProviderClient = ClientProvider();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 550,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Log into\nyour account",
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Handlee",
                    ),
                    //textAlign: TextAlign.justify,
                  ),
                  SizedBox(height: 55),
                  _UsernameField(),
                  SizedBox(height: 15),
                  _PasswordField(),
                  SizedBox(height: 40),
                  _botonLogin(),
                  SizedBox(height: 20),
                  /*Text("¿You don't have an account?",
                      style: TextStyle(
                        fontSize: 13.8,
                        fontFamily: "Roboto",
                        color: Color.fromARGB(255, 110, 110, 110),
                      )),*/
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

Widget _UsernameField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(Icons.person, color: Color.fromARGB(255, 201, 185, 231), size: 30),
        hintText: "Username",
        labelText: "Username",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 201, 185, 231),
          ),
        ),
      ),
    ),
  );
}

Widget _PasswordField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _passwordController,
      keyboardType: TextInputType.emailAddress,
      obscureText: true,
      decoration: InputDecoration(
        icon: Icon(Icons.lock, color: Color.fromARGB(255, 201, 185, 231), size: 30),
        hintText: "Password",
        labelText: "Password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(
            color: Color.fromARGB(255, 201, 185, 231),
          ),
        ),
      ),
    ),
  );
}

Widget _botonLogin() {
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      child: Text(
        "Login",
        style: TextStyle(fontSize: 16),
      ),
    ),
    style: ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 165, 137, 218),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      textStyle: TextStyle(color: Colors.white),
    ),
    onPressed: () {},
  );
}

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
    final getProviderClient=ClientProvider();

    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Login",
                style: TextStyle(fontSize: 30), textAlign: TextAlign.center),
            SizedBox(height: 20),
            _UsernameField(),
            SizedBox(height: 15),
            _PasswordField(),
            SizedBox(height: 20),
            _botonLogin(),
          ],
        ),
      ),
    );
  }
}

TextEditingController _usernameController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

Widget _UsernameField() {
  return TextFormField(
    controller: _usernameController,
    keyboardType: TextInputType.emailAddress,
    decoration: InputDecoration(
      icon: Icon(Icons.person, color: Colors.deepPurple),
      hintText: "Username",
    ),
  );
}

Widget _PasswordField() {
  return TextFormField(
    controller: _passwordController,
    keyboardType: TextInputType.emailAddress,
    obscureText: true,
    decoration: InputDecoration(
      icon: Icon(Icons.lock, color: Colors.deepPurple),
      hintText: "Password",
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
      backgroundColor: Colors.deepPurple,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      elevation: 8,
      textStyle: TextStyle(color: Colors.white),
    ),
    onPressed: () {},
  );
}

import 'package:app_invoice/Pages/Home_Page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:app_invoice/Providers/client_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _usernameController = TextEditingController();        // Controlador del campo de texto del usuario
  TextEditingController _passwordController = TextEditingController();        // Controlador del campo de texto de la contraseña

  @override
  void initState() {                                                          // Método que se ejecuta al iniciar el widget               
    super.initState();
    checkLogin();                                                             // Método que verifica si el usuario ya está logueado
  }

  void checkLogin() async {
    //aqui se verifica si el usuario ya esta logueado
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? val = await pref.getString("login");
    if (val != null) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => HomePage()),
          (route) => false);
    }
  }

  @override
  void dispose() {
    super.dispose();
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
                  ),
                  SizedBox(height: 55),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: TextFormField(
                      controller: _usernameController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email,
                            color: Colors.redAccent,
                            size: 30),
                        hintText: "Email",
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Padding(
                    padding: const EdgeInsets.only(right: 30, left: 20),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                      decoration: InputDecoration(
                        icon: Icon(Icons.lock,
                            color: Colors.redAccent,
                            size: 30),
                        hintText: "Password",
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  ElevatedButton(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                        "Login",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 8,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      login();
                    },
                  ),
                  SizedBox(height: 20),
                  Text("OR",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color.fromARGB(255, 77, 77, 77))),
                  SizedBox(height: 10),
                  Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: RichText(
                            text: TextSpan(
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 77, 77, 77),
                          ),
                          children: [
                            TextSpan(text: "Don't have an account? "),
                            TextSpan(
                              text: "Sign up",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/register');
                                },
                            ),
                          ],
                        )),
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    var status = false;
    final getprovider = ClientProvider();
    var data = await getprovider.getClients();

    if (_usernameController.text.isNotEmpty &&                                // Verifica que los campos no estén vacíos
        _passwordController.text.isNotEmpty) {
      data.map((elem) {                                                       // Recorre la lista de clientes
        if (_usernameController.text == elem.Email &&                         // Verifica que el email ingresado sea igual al de la lista
            _passwordController.text == elem.password) {
          status = true;
          return pageRoute(elem.Client_name, elem.Client_ID);
        }
      }).toList();
      if (status == false) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentials")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Value Found")));
    }
  }

  void pageRoute(String user, int id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", user);
    await pref.setInt("login_id", id);

    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}

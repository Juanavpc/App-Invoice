import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Providers/client_provider.dart';
import 'Home_Page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();                // Constructor de la clase
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController _usernameController = TextEditingController();      // Controlador del campo de texto del nombre de usuario
  TextEditingController _emailController = TextEditingController();         // Controlador del campo de texto del correo electrónico 
  TextEditingController _passwordController = TextEditingController();      // Controlador del campo de texto de la contraseña

  @override
  void initState() {                                                        // Método que se ejecuta al iniciar el widget                     
    super.initState();                                                      // Llamada al método de la clase padre
    checkLogin();
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
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    "Create\nyour account",
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
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                        icon: Icon(Icons.person,
                            color: Colors.redAccent, size: 30),
                        hintText: "Username",
                        labelText: "Username",
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
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        icon: Icon(Icons.email,
                            color: Colors.redAccent, size: 30),
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
                        icon:
                            Icon(Icons.lock, color: Colors.redAccent, size: 30),
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
                        "Register",
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
                      register();
                    },
                  ),
                  SizedBox(height: 15),
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
                            TextSpan(text: "Already have an account? "),
                            TextSpan(
                              text: "Login",
                              style: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(context, '/');
                                },
                            ),
                          ],
                        )),
                      )),
                  SizedBox(height: 15),
                ],
              ),
            ),
          ),
        ));
  }

  void register() async {
    var status = false;
    final getprovider = ClientProvider();                         // Instancia de la clase ClientProvider
    var data = await getprovider.getClients();                    // Se obtienen los datos de los clientes

    if (_usernameController.text.isNotEmpty &&                    // Se verifica que los campos no estén vacíos
        _passwordController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      data.map((elem) {                                           // Se recorre la lista de clientes
        if (_emailController.text == elem.Email) {                // Se verifica que el correo no esté registrado
          status = true;                                          // Se cambia el estado a true
        }
      }).toList();
      if (status == false) {                                      // Si el estado es false, se procede a registrar el usuario                
        var response=await getprovider.addClients(_usernameController.text,         // Se envían los datos al método addClients
            _passwordController.text, _emailController.text);
        pageRoute(_usernameController.text,response);                               // Se envía el nombre de usuario y el estado de la respuesta
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Ya existe")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank Value Found")));
    }
  }
  
  void pageRoute(String user, int id) async {                                   //Funcion para guardar el usuario en el shared preferences
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("login", user);
    await pref.setInt("login_id", id);
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => HomePage()), (route) => false);
  }
}

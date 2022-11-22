import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 228, 228),
      body: Container(
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
              SizedBox(height: 20),
              _FirstNameField(),
              SizedBox(height: 15),
              _LastNameField(),
              SizedBox(height: 15),
              _City(),
              SizedBox(height: 15),
              _Street(),
              SizedBox(height: 15),
              _HouseNumber(),
              SizedBox(height: 15),
              _Zipcode(),
              SizedBox(height: 15),
              _Lat(),
              SizedBox(height: 15),
              _Long(),
              SizedBox(height: 15),
              _PhoneNumber(),
              SizedBox(height: 15),
              _UsernameField(),
              SizedBox(height: 15),
              _EmailField(),
              SizedBox(height: 15),
              _PasswordField(),
              SizedBox(height: 40),
              _botonRegister(),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}

TextEditingController _firstnameController = TextEditingController();
TextEditingController _lastnameController = TextEditingController();
TextEditingController _cityController = TextEditingController();
TextEditingController _streetController = TextEditingController();
TextEditingController _housenumberController = TextEditingController();
TextEditingController _zipcodeController = TextEditingController();
TextEditingController _latController = TextEditingController();
TextEditingController _longController = TextEditingController();
TextEditingController _phonenumberController = TextEditingController();
TextEditingController _usernameController = TextEditingController();
TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();

Widget _FirstNameField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _firstnameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "FirstName",
        labelText: "FirstName",
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

Widget _LastNameField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _lastnameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        hintText: "LastName",
        labelText: "LastName",
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

Widget _City() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _cityController,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: "City",
        labelText: "City",
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

Widget _Street() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _streetController,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        hintText: "Street",
        labelText: "Street",
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

Widget _HouseNumber() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _housenumberController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "House Number",
        labelText: "House Number",
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

Widget _Zipcode() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _zipcodeController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Zipcode",
        labelText: "Zipcode",
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

Widget _Lat() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _latController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Latitude",
        labelText: "Latitude",
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

Widget _Long() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _longController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: "Longitude",
        labelText: "Longitude",
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

Widget _PhoneNumber() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _phonenumberController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        hintText: "Phone",
        labelText: "Phone",
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

Widget _UsernameField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _usernameController,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
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

Widget _EmailField() {
  return Padding(
    padding: const EdgeInsets.only(right: 30, left: 20),
    child: TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: "Email",
        labelText: "Email",
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
      keyboardType: TextInputType.visiblePassword,
      obscureText: true,
      decoration: InputDecoration(
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

Widget _botonRegister() {
  return ElevatedButton(
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
      child: Text(
        "Register",
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

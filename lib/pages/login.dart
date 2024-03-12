// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_final_fields, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_page.dart';

import 'package:flutter_application_1/pages/registration.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController = TextEditingController();
  late TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 4, 131, 222),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(104, 11, 160, 234),
          elevation: 4,
          title: Text(
            'SignUp ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        body: _page(),
      ),
    );
  }

  Widget _page() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icon(),
          SizedBox(
            height: 20,
          ),
          Column(
            children: [],
          ),
          _buildTextField("Enter Email", _usernameController,
              prefixIcon: Icons.email),
          SizedBox(height: 15),
          _buildTextField("Password", _passwordController,
              isPassword: true, prefixIcon: Icons.lock),
          SizedBox(height: 15),
          _submit(),
          SizedBox(
            height: 15,
          ),
          Text("Don't have an account?"),

          _reg(),

          //Text("OR"),

          // _buttons(),
        ],
      ),
    );
  }

  Widget _submit() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          SizedBox(
            width: 30,
          ),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Forgot",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    );
  }

  // ignore: unused_element
  Widget _buttons() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Google",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )),
          SizedBox(width: 50),
          ElevatedButton(
              onPressed: () {},
              child: Text(
                "Facebook",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    );
  }

  Widget _reg() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegistrationPag()));
              },
              child: Text(
                "Registration Form",
                style: TextStyle(
                  color: Colors.blue,
                ),
              )),
        ],
      ),
    );
  }

  Widget _icon() {
    return Container(
      decoration: BoxDecoration(
          border:
              Border.all(color: Color.fromARGB(43, 254, 254, 254), width: 2),
          shape: BoxShape.circle),
      // ignore: prefer_const_constructors
      child: Icon(
        Icons.person,
        color: Color.fromARGB(255, 255, 255, 255),
        size: 120,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget _buildTextField(String Text, TextEditingController controller,
      {bool isPassword = false, IconData? prefixIcon}) {
    return SizedBox(
      width: 250,
      child: TextField(
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          hintText: Text,
          prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,

          labelText: Text,

          // ignore: prefer_const_constructors
          labelStyle: TextStyle(color: Color.fromARGB(250, 0, 0, 0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(49, 0, 0, 0)),
              borderRadius: BorderRadius.circular(12)),

          // ignore: prefer_const_constructors
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromARGB(60, 0, 0, 0)),
              borderRadius: BorderRadius.circular(12)),
        ),
        style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}

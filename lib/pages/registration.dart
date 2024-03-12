// ignore_for_file: prefer_const_constructors, unused_element

import 'package:flutter/material.dart';

class RegistrationPag extends StatefulWidget {
  const RegistrationPag({super.key}); // Use Key? key instead of super.key

  @override
  State<RegistrationPag> createState() => _RegistrationState();
}

class _RegistrationState extends State<RegistrationPag> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromARGB(255, 6, 96, 240),
            Color.fromARGB(255, 255, 255, 255),
          ],
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create a Account'),
        ),
        backgroundColor: Colors.transparent,
        body: _reg(),
      ),
    );
  }

  Widget _reg() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Title(color: Colors.black, child: Text("Registration")),
          SizedBox(height: 20),
          _bulidTextForm(
              "Enter Name",
              TextFormField(
                keyboardType: TextInputType.name,
              )),
          SizedBox(
            height: 15,
          ),
          _bulidTextForm(
            'Enter your email',
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) {
                // Add validation logic here if needed
                return null;
              },
            ),
          ),
          SizedBox(height: 15),
          _bulidTextForm(
              "Enter Password",
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
              ),
              isPassword: true),
          SizedBox(height: 15),
          _bulidTextForm(
            "Enter phone number +91 ",
            TextFormField(
              keyboardType: TextInputType.number,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          _buttons(),
        ],
      ),
    );
  }

  Widget _bulidTextForm(String text, TextFormField field,
      {bool isPassword = false}) {
    return SizedBox(
      width: 300,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: TextStyle(color: Color.fromARGB(255, 4, 0, 0)),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 237, 237, 237)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(255, 240, 240, 240)),
          ),
        ),
        style: TextStyle(color: Color.fromARGB(255, 1, 1, 0)),
      ),
    );
  }
}

Widget _buttons() {
  return Center(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            // Add your submit functionality here
          },
          icon: Icon(Icons.check), // Icon representing submission
          label: Text("Submit"), // Label for the button
        ),
        SizedBox(width: 5),
        ElevatedButton.icon(
          onPressed: () {
            // Add your onPressed callback here
          },
          icon: Icon(Icons.cancel_outlined), // Icon widget
          label: Text("Cancel"), // Label widget
        ),
        SizedBox(width: 2),
      ],
    ),
  );
}

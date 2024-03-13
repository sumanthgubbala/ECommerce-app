// ignore_for_file: sort_child_properties_last, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

class IntroPage extends StatefulWidget {
  // ignore: use_super_parameters
  IntroPage({Key? key}) : super(key: key);
  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  // Remove const keyword here

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30),
            Text(
              "Welcome to E C H O",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 15),
            Text(
              'Shop Anytime, Anywhere: Discover Our E-Commerce App!',
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 33, 33, 33),
              ),
            ),
            SizedBox(height: 50),
            _button(context), // Invoke the _button method without const keyword
          ],
        ),
      )),
    );
  }

  Widget _button(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      },
      child: const Text(
        'Get Started',
        style: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
    );
  }
}

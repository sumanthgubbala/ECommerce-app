import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/intro.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/registration.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroPage(),
      ),
    );
  }
}

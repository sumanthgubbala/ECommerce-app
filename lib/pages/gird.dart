import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mobiletitle.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          
        ],
      ),
    );
  }
}

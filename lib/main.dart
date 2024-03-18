import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/grid_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';
import 'package:flutter_application_1/pages/intro.dart';
import 'package:flutter_application_1/pages/intro/onboard.dart';
// ignore: unused_import
import 'package:flutter_application_1/pages/registration.dart';
import 'package:flutter_application_1/pages/shoppage.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: double.maxFinite,
      child: ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          home: AnimatedSplashScreen(
            splash: Lottie.asset('images/intro.json'),
            nextScreen: IntroPage(),
            splashIconSize: 300,
            splashTransition: SplashTransition.fadeTransition,
            backgroundColor: Colors.blueAccent,

            //lottie: Lottie.assets("images/loading.json"),
          ),
        ),
      ),
    );
  }
}

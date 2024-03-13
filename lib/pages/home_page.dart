// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/bottom.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/orders_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/shoppage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  int selectedIndex = 0;
  void navigateBottom(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  void navigateToPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> _page = [
    ShopPage(),
    CartPage(),
    OrderPage(),
    Profile(),
    LoginPage()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 234, 239, 239),
      appBar: AppBar(
        title: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: TextField(
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black),
              border: InputBorder.none,
            ),
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Perform search functionality here
              },
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                  child: Center(
                child: Text(
                  'E C H O',
                  style: TextStyle(fontSize: 35),
                ),
              )),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('H O M E'),
                onTap: () {
                  navigateToPage(0);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('P R O F I L E'),
                onTap: () {
                  navigateToPage(3);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('L O G O U T'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => LoginPage(),
                  ));
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNav(
        OnTabChange: (int index) => navigateBottom(index),
      ),
      body: _page[selectedIndex],
    );
  }
}

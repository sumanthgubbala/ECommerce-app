// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors_in_immutables

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/bottom.dart';
import 'package:flutter_application_1/pages/cart_page.dart';
import 'package:flutter_application_1/pages/login.dart';
import 'package:flutter_application_1/pages/orders_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';
import 'package:flutter_application_1/pages/shoppage.dart';

import 'profile.dart';

class Home extends StatefulWidget {
  final String username;

  Home({Key? key, required this.username}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Color> clrs = [Colors.red, Colors.blue, Colors.white, Colors.orange];
  var imglis = [];
  var icon = [];
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

  @override
  Widget build(BuildContext context) {
    final List<Widget> _page = [
      ShopPage(
        user: widget.username,
      ),
      CartPage(),
      OrderPage(),
      Profile(fullName: widget.username),
      OrderPage(),
      LoginPage()
    ];
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
          color: Colors.grey[100],
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    DrawerHeader(
                      child: Center(
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              CircleAvatar(
                                radius: 40,
                              ),
                              Text(
                                widget.username,
                                style: TextStyle(fontSize: 35),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
                      leading: Icon(Icons.shopping_cart),
                      title: Text('C A R T'),
                      onTap: () {
                        navigateToPage(1);
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.shopping_cart_checkout),
                      title: Text('O R D E R S'),
                      onTap: () {
                        navigateToPage(2);
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Text('L O G O U T'),
                title: Icon(Icons.logout),
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

  Widget _screen() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(left: 15),
      child: Row(
        children: [
          for (int i = 0; i < 3; i++)
            Container(
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.only(left: 10),
              height: MediaQuery.of(context).size.height / 5.5,
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: clrs[i],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "30% off",
                    style: TextStyle(
                      color: Colors.white10,
                      fontSize: 20,
                    ),
                  ),
                  Container(
                    width: 80,
                    padding: EdgeInsets.all(10),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }
}

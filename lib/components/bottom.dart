// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, must_be_immutable

import 'package:flutter/material.dart';

import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatelessWidget {
  void Function(int)? OnTabChange;
  BottomNav({super.key, required this.OnTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GNav(onTabChange: (value) => OnTabChange!(value), tabs: [
        GButton(
          icon: Icons.home,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shopping_bag_rounded,
          text: 'Cart',
        ),
        GButton(
          icon: Icons.shopping_cart_checkout,
          text: 'orders',
        ),
        GButton(
          icon: Icons.person,
          text: 'profile',
        )
      ]),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mobiletitle.dart';
import 'package:flutter_application_1/components/shoeslist.dart';
import 'package:flutter_application_1/products/shoes.dart';
//import '../components/mobile.dart'; // Import your Mobiles widget
import '../products/cart.dart';
import '../products/mobile.dart'; // Import your Mobile class
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({Key? key}) : super(key: key);

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  void additemtocart(Mobile mobile) {
    Provider.of<Cart>(context, listen: false).addMobileToCart(mobile);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${mobile.name} to cart!')),
    );
  }

  void addshoestocart(Shoes shoes) {
    Provider.of<Cart>(context, listen: false).addShoesToCart(shoes);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${shoes.name} to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightBlue,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
              ),
              title: Text("E C H O S H O P P I N G"),
            ),
            automaticallyImplyLeading: false,
            floating: false,
            pinned: false,
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Text(
                    'Trendings', // Add your desired title here
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200, // Adjust the height as needed
                  child: Consumer<Cart>(
                    builder: (context, value, child) => PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.mobileList.length,
                      itemBuilder: (context, index) {
                        Mobile mobile = value.getMobileList()[index];
                        return Mobiles(
                          mobile: mobile,
                          onTap: () => additemtocart(mobile),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    'Featured Products', // Add your desired title here
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200, // Adjust the height as needed
                  child: Consumer<Cart>(
                    builder: (context, value, child) => PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.shoesList.length,
                      itemBuilder: (context, index) {
                        Shoes shoes = value.getShoesList()[index];
                        return ShoesSection(
                          shoeprod: shoes,
                          onTap: () => addshoestocart(shoes),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(
                'All Products', // Add your desired title here
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Text(
                    'Featured Products', // Add your desired title here
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 200, // Adjust the height as needed
                  child: Consumer<Cart>(
                    builder: (context, value, child) => ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: value.shoesList.length,
                      itemBuilder: (context, index) {
                        Shoes shoes = value.getShoesList()[index];
                        return ShoesSection(
                          shoeprod: shoes,
                          onTap: () => addshoestocart(shoes),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

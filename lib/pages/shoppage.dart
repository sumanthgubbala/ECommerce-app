// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/mobiletitle.dart';
import 'package:flutter_application_1/components/shoeslist.dart';
import 'package:flutter_application_1/products/shoes.dart';
import '../components/mobillist.dart';
import '../products/cart.dart';
import '../products/mobile.dart';
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
    final screenWidth = MediaQuery.of(context).size.width;
    final crossAxisCount = screenWidth ~/ 180; // Adjust item width as needed
    final aspectRatio = 0.35; // Adjust the aspect ratio as needed

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightBlue,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
              ),
              title: Container(
                child: Text(
                  "E C H O S H O P P I N G",
                  style: TextStyle(fontSize: 18),
                ),
              ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trendings',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'See All',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 450,
                  child: Consumer<Cart>(
                    builder: (context, value, child) => PageView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: value.mobileList.length,
                      itemBuilder: (context, index) {
                        Mobile mobile = value.getMobileList()[index];
                        return Mobilellist(
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
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Featured Products',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Veiw all',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 450,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'List Veiw',
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: Consumer<Cart>(
              builder: (context, value, child) => SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: aspectRatio,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Shoes shoes = value.getShoesList()[index];
                    return GestureDetector(
                      child: ShoesSection(
                        shoeprod: shoes,
                        onTap: () => addshoestocart(shoes),
                      ),
                    );
                  },
                  childCount: value.getShoesList().length,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: Consumer<Cart>(
              builder: (context, value, child) => SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: aspectRatio,
                ),
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    Mobile mobile = value.getMobileList()[index];
                    return GestureDetector(
                      child: Mobiles(
                        mobile: mobile,
                        onTap: () => additemtocart(mobile),
                      ),
                    );
                  },
                  childCount: value.getMobileList().length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

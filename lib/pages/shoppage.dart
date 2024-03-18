// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/components/mobiletitle.dart';
import 'package:flutter_application_1/components/shoeslist.dart';
import 'package:flutter_application_1/pages/demo.dart';
import 'package:flutter_application_1/products/shoes.dart';
import '../components/mobillist.dart';
import '../products/cart.dart';
import '../products/mobile.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  var user;
  ShopPage({this.user});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<Color> clrs = [Colors.red, Colors.blue, Colors.pink, Colors.orange];
  var imglis = [
    'images/iphone12.png',
    'images/iphone12.png',
    'images/iphone12.png',
    'images/iphone12.png',
  ];
  var icon = [];

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
          SliverToBoxAdapter(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  child: demo(
                    user: widget.user,
                  ),
                )
              ])),
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 15),
                    child: Row(
                      children: [
                        for (int i = 0; i < 4; i++)
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.only(left: 10),
                            height: MediaQuery.of(context).size.height / 3.5,
                            width: MediaQuery.of(context).size.width / 1.5,
                            decoration: BoxDecoration(
                              color: clrs[i],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "30% off on summer collection",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 22,
                                        ),
                                      ),
                                      Container(
                                        width: 90,
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Coupon Code",
                                            style: TextStyle(
                                              color: clrs[i],
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Image.asset(
                                  imglis[i],
                                  height: 180,
                                  width: 110,
                                )
                              ],
                            ),
                          )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
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
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Consumer<Cart>(
                      builder: (context, cart, child) => Row(
                        children: List.generate(
                          cart.mobileList.length,
                          (index) {
                            Mobile mobile = cart.getMobileList()[index];
                            return Mobilellist(
                              mobile: mobile,
                              onTap: () => additemtocart,
                            );
                          },
                        ),
                      ),
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

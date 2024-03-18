// ignore_for_file: prefer_const_constructors, unused_local_variable, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:flutter_application_1/products/shoes.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:provider/provider.dart';

class MobileGrid extends StatefulWidget {
  const MobileGrid({Key? key}) : super(key: key);

  @override
  State<MobileGrid> createState() => _MobileGridState();
}

class _MobileGridState extends State<MobileGrid> {
  void additemtocart(Mobile mobile) {
    Provider.of<Cart>(context, listen: false).addMobileToCart(mobile);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${mobile.name} to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        (screenWidth / 200).floor(); // Adjust according to item width
    double itemAspectRatio = 0.95;
    final List<Mobile> mobileList = Provider.of<Cart>(context).getMobileList();

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: itemAspectRatio,
        ),
        itemCount: mobileList.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 4.0,
            child: Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "30% off",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Image.asset(
                      mobileList[index].imgpath,
                      width: 100,
                      height: 70,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                      right: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          mobileList[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              'Price: ${mobileList[index].price}',
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.redAccent,
                                  fontWeight: FontWeight.bold),
                            ),
                            SizedBox(width: 2),
                            Text(
                              '1,30,000',
                              style: TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () => additemtocart(mobileList[index]),
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    bottomLeft: Radius.circular(10),
                                  ),
                                ),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ShoesGrid extends StatefulWidget {
  const ShoesGrid({Key? key}) : super(key: key);

  @override
  State<ShoesGrid> createState() => _ShoesGridState();
}

class _ShoesGridState extends State<ShoesGrid> {
  @override
  Widget build(BuildContext context) {
    final List<Shoes> shoesList = Provider.of<Cart>(context).getShoesList();
    void addshoestocart(Shoes shoes) {
      Provider.of<Cart>(context, listen: false).addShoesToCart(shoes);
      final cart = Provider.of<Cart>(context, listen: false);
      // Check if the shoes are already in the cart
      final existingCartItem = cart.getUserCart().firstWhere(
            (item) => item.shoes == shoes,
          );

      if (existingCartItem != 0) {
        // If shoes are already in the cart, increment their quantity
        cart.incshoeQuantity(existingCartItem);
      } else {
        // Otherwise, add shoes to the cart
        cart.addShoesToCart(shoes);
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Added ${shoes.name} to cart!')),
      );
    }

    double screenWidth = MediaQuery.of(context).size.width;
    int crossAxisCount =
        (screenWidth / 200).floor(); // Adjust according to item width
    double itemAspectRatio = 0.95;

    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: itemAspectRatio,
      ),
      itemCount: shoesList.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 4.0,
          child: Padding(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "30% off",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.redAccent,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    shoesList[index].imgpath,
                    width: 100,
                    height: 90,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoesList[index].name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Text(
                            'Price: ${shoesList[index].price}',
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 2),
                          Text(
                            '1,30,000',
                            style: TextStyle(
                              decoration: TextDecoration.lineThrough,
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("${shoesList[index].quantity}"),
                          GestureDetector(
                            onTap: () => addshoestocart(shoesList[index]),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                ),
                              ),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

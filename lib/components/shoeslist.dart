// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/shoes.dart';
import 'package:provider/provider.dart';

import '../products/cart.dart';

class ShoesSection extends StatefulWidget {
  Shoes shoeprod;

  void Function()? onTap;

  ShoesSection({super.key, required this.shoeprod, required this.onTap});

  @override
  State<ShoesSection> createState() => _ShoesSectionState();
}

class _ShoesSectionState extends State<ShoesSection> {
  void addshoestocart() {
    Provider.of<Cart>(context, listen: false).addShoesToCart(widget.shoeprod);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${widget.shoeprod.name} to cart!')),
    );
  }

  void inc() {
    setState(() {
      widget.shoeprod.quantity++;
    });
  }

  void dec() {
    setState(() {
      widget.shoeprod.quantity--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 1,
        margin: EdgeInsets.all(8),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.shoeprod.imgpath,
                  height: 250,
                  fit: BoxFit.fill,
                ),
                Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(children: [
                      Text(
                        widget.shoeprod.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Price :\nRs." + widget.shoeprod.price.toString(),
                            textAlign: TextAlign.left,
                          ),
                          GestureDetector(
                            onTap: addshoestocart,
                            child: Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10))),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ])),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: dec,
                        ),
                        Text('${widget.shoeprod.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: inc,
                        ),
                      ],
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

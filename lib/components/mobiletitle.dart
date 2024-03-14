// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:provider/provider.dart';
import '../products/mobile.dart';

class Mobiles extends StatefulWidget {
  Mobile mobile;
  void Function()? onTap;
  Mobiles({super.key, required this.mobile, required this.onTap});

  @override
  State<Mobiles> createState() => _MobilesState();
}

class _MobilesState extends State<Mobiles> {
  void additemtocart() {
    Provider.of<Cart>(context, listen: false).addMobileToCart(widget.mobile);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Added ${widget.mobile.name} to cart!')),
    );
  }

  void inc() {
    setState(() {
      widget.mobile.quantity++;
    });
  }

  void dec() {
    if (widget.mobile.quantity > 1) {
      setState(() {
        widget.mobile.quantity--;
      });
    }
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
                  widget.mobile.imgpath,
                  height: 250,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Column(children: [
                    Text(
                      widget.mobile.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price :\nRs." + widget.mobile.price.toString(),
                          textAlign: TextAlign.left,
                        ),
                        GestureDetector(
                          onTap: additemtocart,
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
                    )
                  ]),
                ),
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
                        Text('${widget.mobile.quantity}'),
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: inc,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

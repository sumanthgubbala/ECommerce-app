// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, use_super_parameters

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/cart.dart';
import 'package:flutter_application_1/products/mobile.dart';
import 'package:provider/provider.dart';

class Mobilellist extends StatefulWidget {
  final Mobile mobile;
  final void Function()? onTap;

  Mobilellist({Key? key, required this.mobile, required this.onTap})
      : super(key: key);

  @override
  State<Mobilellist> createState() => _MobilellistState();
}

class _MobilellistState extends State<Mobilellist> {
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
    final screenWidth = MediaQuery.of(context).size.width;

    // Calculate image dimensions based on screen width
    final double imageWidth = screenWidth * 0.4;
    final double imageHeight = imageWidth * 1.5; // Maintain aspect ratio

    return Builder(
      builder: (context) {
        return Container(
          width: screenWidth,
          height: imageHeight + 16,
          child: Card(
            elevation: 1,
            margin: EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  widget.mobile.imgpath,
                  width: imageWidth,
                  height: imageHeight,
                  fit: BoxFit.cover,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.mobile.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text("Price : Rs ${widget.mobile.price}"),
                        SizedBox(height: 6),
                        Row(
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
                        ),
                      ],
                    ),
                  ),
                ),
                if (screenWidth >
                    300) // Display the GestureDetector for wide screens
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    GestureDetector(
                      onTap: () => additemtocart,
                      child: Container(
                        padding: EdgeInsets.all(20),
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
                  ]),
              ],
            ),
          ),
        );
      },
    );
  }
}

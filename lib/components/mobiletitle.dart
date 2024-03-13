// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../products/mobile.dart';

class Mobiles extends StatelessWidget {
  Mobile mobile;
  void Function()? onTap;
  Mobiles({super.key, required this.mobile, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 250,
      height: 200,
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            child: Image.network(
              mobile.imgpath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Text(mobile.name),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(mobile.description,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mobile.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 9,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      mobile.price,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.remove)),
                Text(
                  "0",
                  style: TextStyle(color: Colors.grey),
                ),

                IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                //plus button
                GestureDetector(
                  onTap: onTap,
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
          ),
        ],
      ),
    );
  }
}

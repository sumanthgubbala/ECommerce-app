// ignore_for_file: must_be_immutable, unused_import, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/products/shoes.dart';

class ShoesSection extends StatelessWidget {
  Shoes shoeprod;

  void Function()? onTap;

  ShoesSection({super.key, required this.shoeprod, required this.onTap});

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
              shoeprod.imgpath,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          // Text(mobile.name),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(shoeprod.description,
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
                      shoeprod.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      shoeprod.price,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
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

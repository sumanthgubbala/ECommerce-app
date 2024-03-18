// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/grid_page.dart';

class demo extends StatefulWidget {
  final user;
  const demo({required this.user});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List<Color> clrs = [
    Colors.red,
    Colors.blue,
    Colors.green,
  ];

  var img = [
    'images/iphone12.png',
    'images/slide1.png',
    'images/slide4.png',
  ];
  var iconsl = [
    'images/icon1.png',
    'images/icon2.png',
    'images/icon3.png',
    'images/icon4.png',
    'images/icon5.png',
    'images/icon6.png',
    'images/icon7.png',
  ];
  var pname = [
    "Samsung s23",
    "Iphone 12",
    "Nothing 1",
    "Nothing 2",
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 40, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Icon(
                  Icons.person,
                  size: 28,
                ),
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 4,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Icon(
                  Icons.sort,
                  size: 28,
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Helloo ${widget.user}",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 5),
              Text(
                "Lets shop something!",
                style: TextStyle(fontSize: 18, color: Colors.black45),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.only(left: 15),
          child: Row(
            children: [
              for (int i = 0; i < 3; i++)
                Container(
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.only(left: 10),
                  width: MediaQuery.of(context).size.width / 1.5,
                  height: MediaQuery.of(context).size.height / 5.5,
                  decoration: BoxDecoration(
                      color: clrs[i], borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "30% of on summer collection",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ),
                          ),
                          Container(
                            width: 80,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text(
                                "shop now",
                                style: TextStyle(
                                    fontSize: 10,
                                    color: Colors.orange,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )
                        ],
                      )),
                      Image.asset(
                        img[i],
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top Categories",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              Text(
                "see all",
                style: TextStyle(color: Colors.black, fontSize: 13),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Row(
              children: [
                for (var i = 0; i < 7; i++)
                  Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              spreadRadius: 2)
                        ]),
                    child: Padding(
                      padding: EdgeInsets.all(6),
                      child: Image.asset(iconsl[i]),
                    ),
                  )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        MobileGrid(),
        SizedBox(
          height: 30,
        ),
        ShoesGrid()
      ],
    ));
  }
}

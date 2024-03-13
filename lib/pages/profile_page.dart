// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.lightBlue,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Colors.pink,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 64,
                    ),
                    Text('E C H O T E A M'),
                  ],
                ),
              ),
              //title: Text("E C H O S H O P P I N G"),
            ),
            automaticallyImplyLeading: true,
            floating: true,
            pinned: false,
            title: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(color: Colors.white),
                  border: InputBorder.none,
                ),
                style: TextStyle(color: Colors.white),
              ),
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    // Perform search functionality here
                  },
                ),
              ],
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  color: Colors.white10,
                  child: PageView(
                    children: [
                      Text(
                        "Profile Settings",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "My Orders",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  color: Colors.white10,
                  child: PageView(
                    children: [
                      Text(
                        "Settings",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Text(
                            "profile settings",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 40,
                                backgroundColor: Colors.white),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        "Feedback",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Text(
                        "LogOut",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.logout,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

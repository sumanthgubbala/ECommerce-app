import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/button.dart';
import 'package:flutter_application_1/pages/login.dart';

class Profile extends StatelessWidget {
  final String fullName;
  static String email = 'naruto@example.com';
  static String usrName = 'naruto123';

  Profile({required this.fullName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.black,
                  radius: 77,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("images/naruto.png"),
                    radius: 75,
                  ),
                ),
                const SizedBox(height: 10),
                Text(fullName,
                    style: const TextStyle(fontSize: 28, color: Colors.grey)),
                Text(email,
                    style: const TextStyle(fontSize: 17, color: Colors.grey)),
                Button(
                  label: "LOG OUT",
                  press: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  subtitle: const Text("Full name"),
                  title: Text(fullName),
                ),
                ListTile(
                  leading: const Icon(Icons.email, size: 30),
                  subtitle: const Text("Email"),
                  title: Text(email),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle, size: 30),
                  subtitle: Text(usrName),
                  title: const Text("admin"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

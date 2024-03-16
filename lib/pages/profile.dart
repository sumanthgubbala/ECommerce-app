import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/pages/button.dart';
import 'package:flutter_application_1/pages/login.dart';
// ignore: depend_on_referenced_packages

// Import primaryColor from your project colors file

import '../JSON/user.dart';

class Profile extends StatelessWidget {
  final Users? profile;
  const Profile({Key? key, this.profile}) : super(key: key);

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
                    backgroundImage: AssetImage("assets/no_user.jpg"),
                    radius: 75,
                  ),
                ),
                const SizedBox(height: 10),
                Text(profile!.fullName ?? "",
                    style: const TextStyle(fontSize: 28, color: Colors.grey)),
                Text(profile!.email ?? "",
                    style: const TextStyle(fontSize: 17, color: Colors.grey)),
                Button(
                  label: "LOG OUT",
                  press: () {
                    // Navigate to the login screen or a logout screen
                    // For simplicity, navigating to the LoginScreen here
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.person, size: 30),
                  subtitle: const Text("Full name"),
                  title: Text(profile!.fullName ?? ""),
                ),
                ListTile(
                  leading: const Icon(Icons.email, size: 30),
                  subtitle: const Text("Email"),
                  title: Text(profile!.email ?? ""),
                ),
                ListTile(
                  leading: const Icon(Icons.account_circle, size: 30),
                  subtitle: Text(profile!.usrName),
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

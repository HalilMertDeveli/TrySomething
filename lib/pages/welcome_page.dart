import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  final String userName;
  final String userEmail;
  WelcomePage({super.key, required this.userName, required this.userEmail});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Welcome Page"),
        ),
        body: Column(
          children: [
            Text(
              "Your User name is : " + widget.userName,
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Your email address is :" + widget.userEmail,
            ),
          ],
        ));
  }
}

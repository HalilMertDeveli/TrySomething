import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(
        userName: "Halil Mert",
        userSurName: "Develi",
      ),
    ),
  );
}

class HomePage extends StatefulWidget {
  final String userName;
  final String userSurName;
  const HomePage(
      {super.key, required this.userName, required this.userSurName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Some class operation",
          style: TextStyle(
            color: Colors.black12,
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text("userName: ${widget.userName}"),
          ),
          SizedBox(
            height: 22,
          ),
          Text("user sur name: ${widget.userSurName}"),
        ],
      ),
    );
  }
}

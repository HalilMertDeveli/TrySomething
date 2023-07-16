import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int number = 0;

  Stream<int> createStream() {
    return Stream.periodic(
      Duration(seconds: 2),
      (count) => number = (count * 2),
    );
  }
  
  @override
  void initState() {
    super.initState();
    createStream().listen((eventReturn) {
      setState(() {
        number = eventReturn;
      });
     });
     
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<int>(
        stream:createStream(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListTile(
              title: Text("Our value is = ${number.toString()}"),
            );
          }
          if (snapshot.hasError) {
            return Text("There is error in builder things");
          }
          else{
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}

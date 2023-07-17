import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String id = "";
  String name = "";

  String stringSubOperation(String inputString) {
    return inputString.substring(0, inputString.indexOf("_"));//0 'dan başla _ görene kadar devam et, _ gördükten sonra kalan kısmı sil at
  }

  String nameSubStringOperation(String inputName) {
    //return inputName.substring(inputName.indexOf("_")+1);//_ gördükten sonra bir eleman olan kendisini atla ve yazdır
    //return inputName.substring(inputName.indexOf("_")+3);//_ gördükten sonra iki eleman olan ve  kendisi de dahil  atla ve yazdır
    return inputName.substring(inputName.indexOf("_"),3);
  }

  @override
  void initState() {
    super.initState();
    id = stringSubOperation("halil_mert");
    name = nameSubStringOperation("_Halil");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("String manipulation"),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              id + " = " + name,
            ),
          ),
        ],
      ),
    );
  }
}

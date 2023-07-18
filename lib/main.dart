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

// 

class HomePage extends StatefulWidget {
  final String userName;
  final String userSurName;
  const HomePage(
      {super.key, required this.userName, required this.userSurName});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final elementForList = ["element 1", "element 2", "element 3"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sorting element in Listview builder",
          style: TextStyle(
              color: Colors.amber, fontSize: 33, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:elementForList.length,
              itemBuilder: (BuildContext context, int index) {
                //int reversedIndex = elementForList.length-index -1;
              return ListTile(
                title: Text(
                  elementForList[index].toString(),
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  index.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}

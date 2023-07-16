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
  final counterBlock = CounterBlock();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Stream usages",
          textAlign: TextAlign.center,
        ),
      ),
      body: Center(
          child: StreamBuilder<int>(
            stream: counterBlock.counterStream,
            initialData: 0,
            builder: (context, snapshot) {
              return Text(
                'Counter: ${snapshot.data}',
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterBlock.incrementCounter();
          },
          child: Icon(Icons.add),
        ),
      
    );
  }
}

class CounterBlock {
  final _counterController = StreamController<int>();
  Stream<int> get counterStream => _counterController.stream;

  int _counter = 0;

  void incrementCounter() {
    _counter++;
    _counterController.sink.add(_counter);
  }
}

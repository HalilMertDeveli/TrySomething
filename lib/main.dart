import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home page"),
      ),
      body: Center(
        child: IconButton(
          onPressed: () async {
            await goLoginPage(
              context,
              Loginpage(
                  userName: "Halil Mert", userSurName: "Develi", userAge: 13),
            );
          },
          icon: Icon(Icons.next_plan),
        ),
      ),
    );
  }
}

Future<void> goLoginPage(BuildContext context, Widget className) async {
  await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => className,
      ));
}

class Loginpage extends StatefulWidget {
  final String userName;
  final String userSurName;
  final int userAge;
  const Loginpage(
      {super.key,
      required this.userName,
      required this.userSurName,
      required this.userAge});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Center(
        child: Text("Login page "),
      ),
    );
  }
}

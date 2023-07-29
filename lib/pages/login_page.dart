import 'package:flutter/material.dart';
import 'package:try_something/pages/welcome_page.dart';
import 'package:try_something/services/auth_service.dart';
import 'package:try_something/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String userName = "";
  String userPassword = "";
  String userEmail = "";
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(49),
                ),
                label: Text(
                  "Enter your Email ",
                ),
              ),
              onChanged: (value) {
                setState(() {
                  userEmail = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49)),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(49),
                  ),
                  label: Text("Enter you userName")),
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(49)),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(49),
                  ),
                  label: Text("Enter your password")),
              onChanged: (value) {
                setState(
                  () {
                    userPassword = value;
                  },
                );
              },
            ),
            ElevatedButton(
              onPressed: () async {
                if (userName != "" && userEmail != "" && userPassword != "") {
                  await firebaseAuthService
                      .registerWithEmailAndPassword(
                          userName, userEmail, userPassword)
                      .then(
                        (value) => goToGivedScreen(
                          context,
                          WelcomePage(userName: userName, userEmail: userEmail),
                        ),
                      );
                }
              },
              child: Row(
                children: [
                  Icon(Icons.create),
                  Text(
                    "Create group with firebase,",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

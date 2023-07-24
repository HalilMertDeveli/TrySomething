import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:try_something/firebase_options.dart';
import 'package:try_something/pages/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    ),
  );
}








import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:try_something/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

void goToGivedScreen(BuildContext context, Widget destionationPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destionationPage,
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = "";
  String userPassword = "";
  String userEmail = "";
  final FirebaseAuthService firebaseAuthService = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
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
                )),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(49),
                )),
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
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(49)),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(49),
                )),
            onChanged: (value) {
              setState(() {
                userPassword = value;
              });
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
                        WelcomePage(),
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
    );
  }
}

class DatabaseService {
  final String? outoGeneratedUserId;
  DatabaseService(this.outoGeneratedUserId);

  final CollectionReference userCollection = FirebaseFirestore.instance.collection("users");
  final CollectionReference groupsCollection =FirebaseFirestore.instance.collection("groups");

  Future saveNewUserDataToFirebase(
      String userFullName, String userEmail) async {
    return await userCollection.doc(outoGeneratedUserId).set({
      "userId": outoGeneratedUserId,
      "userName": userFullName,
      "userEmail": userEmail,
      "groups": [],
      "profilePicUrl": "",
    });
  }

  Future createGroup(String userName, String userId, String groupName) async {}
}

class FirebaseAuthService {
  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      String userName, String userEmail, String userPassword) async {
    try {
      User user = (await firebaseAuthInstance.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;
      if(user != null){
        await DatabaseService(user.uid)
          .saveNewUserDataToFirebase(userName, userEmail);

      }

      
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

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
    );
  }
}

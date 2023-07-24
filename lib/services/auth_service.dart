import 'package:firebase_auth/firebase_auth.dart';
import 'package:try_something/services/database_service.dart';

class FirebaseAuthService {
  final FirebaseAuth firebaseAuthInstance = FirebaseAuth.instance;

  Future registerWithEmailAndPassword(
      String userName, String userEmail, String userPassword) async {
    try {
      User user = (await firebaseAuthInstance.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword))
          .user!;
      if (user != null) {
        await DatabaseService(user.uid)
            .saveNewUserDataToFirebase(userName, userEmail);
      }
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }
}

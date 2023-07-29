import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String? outoGeneratedUserId;
  DatabaseService(this.outoGeneratedUserId);

  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection("users");
  final CollectionReference groupsCollection =
      FirebaseFirestore.instance.collection("groups");

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

  Future<Stream> getGroupMember(String groupId)async{
    return groupsCollection.doc(groupId).snapshots();
  }
}

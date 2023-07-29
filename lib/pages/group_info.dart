import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:try_something/services/database_service.dart';

class GroupInfo extends StatefulWidget {
  final String groupId;
  const GroupInfo({super.key, required this.groupId});

  @override
  State<GroupInfo> createState() => _GroupInfoState();
}

class _GroupInfoState extends State<GroupInfo> {
  Stream? groupMembers;

  @override
  void initState() {
    getMembers();
    super.initState();
  }

  Future<void> getMembers()async{
    DatabaseService(FirebaseAuth.instance.currentUser?.uid).getGroupMember(widget.groupId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
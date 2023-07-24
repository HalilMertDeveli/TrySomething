import 'package:flutter/material.dart';

void goToGivedScreen(BuildContext context, Widget destionationPage) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => destionationPage,
    ),
  );
}
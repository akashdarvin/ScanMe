import 'package:flutter/material.dart';

import '../domain/ocr_entity.dart';

class ResultScreen extends StatelessWidget {
   const ResultScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("name; ${user.name}"),
          Text("adhaarNumber; ${user.aadhaarNumber}"),
          Text("dob; ${user.dob}"),
          Text("gender; ${user.gender}"),
          Text("phoneNumber; ${user.phoneNumber}")
        ],
      ),
    );
  }
}
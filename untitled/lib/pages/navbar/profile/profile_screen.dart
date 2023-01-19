import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Text('الملف الشخصي',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Assistant",
              fontSize: 21,
              fontWeight: FontWeight.bold,
            )),
      ),
      body: Body(),
    );
  }
}
// AppBar(
// backwardsCompatibility: false,
// backgroundColor: kPrimaryColor,
// title: Text("الملف الشخصي"),
// ),
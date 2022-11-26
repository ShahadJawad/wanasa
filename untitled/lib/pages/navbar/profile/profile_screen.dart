import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';

import 'components/body.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text("الملف الشخصي"),
      ),
      body: Body(),
    );
  }
}

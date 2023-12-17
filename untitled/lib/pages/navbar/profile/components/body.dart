import 'package:flutter/material.dart';
import 'package:untitled/pages/login_page.dart';
import 'package:untitled/pages/navbar/profile/content/helpCenter.dart';

import 'profile_menu.dart';
import 'profile_pic.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "حسابي",
            icon: "assets/icons/User Icon.svg",
            press: () => {

            },
          ),
          ProfileMenu(
            text: "الأشعارات",
            icon: "assets/icons/Bell.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "الأعدادات",
            icon: "assets/icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "مركز المساعده",
            icon: "assets/icons/Question mark.svg",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => helpCenter(),));
            },
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "assets/icons/Log out.svg",
            press: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => login(),));
            },
          ),
        ],
      ),
    );
  }
}

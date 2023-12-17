import 'package:flutter/material.dart';

class helpCenter extends StatelessWidget {
  const helpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String helpCenterText =" اهلا بكم في تطبيق وناسه \n تطبيق وناسة هو تطبيق لاهم المعالم السياحيه في العراق ليساعدك على ايجاد مكان مناسب لرحلتك \n تم تصميمه على ايادي مبرمجين عراقيين وهم \n شهد جواد , ود كريم , فاطمه علي  ";
    return  Scaffold(
      backgroundColor:  Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            helpCenterText,
            style: TextStyle(color: Colors.black,fontSize: 19),
          ),
        ),
      ),
    );
  }
}

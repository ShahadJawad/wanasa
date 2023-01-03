import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:untitled/auth_server.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/pages/navbar/Home_page.dart';
import 'package:untitled/pages/login_page.dart';
import 'introduction_screen.dart';


class splash_page extends StatefulWidget {
  @override
  _SecondClassState createState() => _SecondClassState();
}

class _SecondClassState extends State<splash_page>
    with TickerProviderStateMixin {
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    )..addStatusListener(
          (status) {
        if (status == AnimationStatus.completed) {
          Navigator.of(context).pushReplacement(
            PageTransition(
              type: PageTransitionType.bottomToTop,
             child: IntroScreen(),
          //   login(),
            ),
          );
          Timer(
            Duration(milliseconds: 300),
                () {
              scaleController.reset();
            },
          );
        }
      },
    );

    scaleAnimation =
        Tween<double>(begin: 0.0, end: 12).animate(scaleController);

    Timer(Duration(seconds: 2), () {
      setState(() {
        scaleController.forward();
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    scaleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:const BoxDecoration(
            image: DecorationImage(image: AssetImage('assest/images/backrounds.jpg'),
                fit: BoxFit.fill)),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(fontSize: 30.0),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText(
                  'اهلاَ بكم !',
                  textStyle: TextStyle(color:kPrimaryColor,fontFamily: 'Alkalami'),

                  speed: Duration(milliseconds: 150),
                ),
              ],
              isRepeatingAnimation: false,
              repeatForever: false,
              displayFullTextOnTap: false,
            ),
          ),
        ),
      ),
    );
  }
}





























// import 'dart:async';
// import 'dart:ui';
// import 'package:flutter/material.dart';
//
// import '../auth_server.dart';
// import '../constants.dart';
// import 'login_page.dart';
//
// class Splash_Screen extends StatefulWidget {
//   const Splash_Screen({super.key,});
//
//
//   @override
//   State<Splash_Screen> createState() => _Splash_ScreenState();
// }
//
// class _Splash_ScreenState extends State<Splash_Screen> {
//   void initState() {
//     super.initState();
//     startSplashScreenTimer();
//   }
//
//   startSplashScreenTimer() async {
//     var _duration = new Duration(seconds: 5);
//     return new Timer(_duration, navigationToNextPage);
//   }
//
//   void navigationToNextPage() async {
//     Navigator.pushAndRemoveUntil(
//       context, new MaterialPageRoute(builder: (context) => new  AuthServic().handleAuthState(),),
//       (Route<dynamic> route) => false, //
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor:kPrimaryColor,
//         body: Center(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: MediaQuery.of(context).size.width / 1,
//               ),
//               const Text(
//                 'وناسه',
//                 style: TextStyle(
//                   fontSize: 40,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(
//                 height: MediaQuery.of(context).size.width / 2,
//               ),
//               const CircularProgressIndicator(
//                 backgroundColor: Colors.white,
//               )
//             ],
//           ),
//         ));
//   }
// }

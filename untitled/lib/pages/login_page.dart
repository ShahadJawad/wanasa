import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/pages/mainPage.dart';
import '../auth_server.dart';
import '../constants.dart';
import '../widgets/orginalbutton.dart';
import '../widgets/textfiled.dart';
class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: ScrollConfiguration(
        behavior: MyBehavior(),
    child: SingleChildScrollView(
    child: SizedBox(
    height: size.height,
    child: Stack(
    children: [
    SizedBox(
    height: size.height,
    child: Image.asset(
    'assest/images/backrounds.jpg',
    // #Image Url: https://unsplash.com/photos/bOBM8CB4ZC4
    fit: BoxFit.fitHeight,
    ),
    ),
    Center(
    child: Column(
     crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Expanded(
    child: SizedBox(),
    ),
    Expanded(
    flex: 7,
    child: ClipRRect(
    borderRadius: BorderRadius.circular(30),
    child: BackdropFilter(
    filter: ImageFilter.blur(sigmaY: 25, sigmaX: 25),
    child: SizedBox(
    width: size.width * .9,

                  //in box
                  child: Column(
              children: [
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> mainPage()));
                      },
                      child: const Text('X',
                        style: TextStyle(fontSize: 19,color: Colors.grey),)),
                  ], ),

                //logo image
               Container(
                   height: 190,width: 200,
                   child: const Image(image: AssetImage(logoimage),fit: BoxFit.fill, )),

                  SizedBox(height: 19,),
                  //email filed
                  textform(myicon:const Icon(Icons.email_outlined,color: kPrimaryColor),
                    hinttext:"البريد الالكتروني" ,
                  ),
               //password field
               const SizedBox(height: 15),
                textform(myicon:const Icon(Icons.key_outlined,color: kPrimaryColor),
                  hinttext:"الرمز السري" ,
                  suffixIcon:const Icon(Icons.remove_red_eye,color: kPrimaryColor) ,
                ),

               const SizedBox(height:40),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 21),
                    height: 40,
                    width: double.infinity,
                    child: orginalButton(text: 'تسجيل الدخول', onPressed: (){})),

                const SizedBox(height:15),
                Container(
                    margin:const EdgeInsets.symmetric(horizontal: 21),
                    height: 60,
                    width:100,
                    child: GestureDetector(
                      onTap:() {
                        AuthServic().signInWithGoogle();
                      },
                      child:const Image(image: AssetImage('assest/images/wgooglepng.png'),fit: BoxFit.fill),
                    ))

              ],
            ),


    ),
    ),
    ),
    ),
      Expanded(
        child: SizedBox(),
      ),
    ],
    ),
    ),
    ],
    ),
    ),
    ),
        ),
    );
  }

  Widget component(
  IconData
  icon, String hintText, bool isPassword, bool isEmail) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.width / 8,
      width: size.width / 1.25,
      alignment: Alignment.center,
      padding: EdgeInsets.only(right: size.width / 30),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        style: TextStyle(
          color: Colors.white.withOpacity(.9),
        ),
        obscureText: isPassword,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
        decoration: InputDecoration(
          prefixIcon: Icon(
            icon,
            color: Colors.white.withOpacity(.8),
          ),
          border: InputBorder.none,
          hintMaxLines: 1,
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(.5),
          ),
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context,
      Widget child,
      AxisDirection axisDirection,
      ) {
    return child;
  }
}








//
// child: Column(
// mainAxisAlignment:
// MainAxisAlignment.spaceBetween,
// children: [
// Padding(
// padding: EdgeInsets.only(
// top: size.width * .15,
// bottom: size.width * .1,
// ),
// child: Text(
// 'SIGN IN',
// style: TextStyle(
// fontSize: 25,
// fontWeight: FontWeight.w600,
// color: Colors.white.withOpacity(.8),
// ),
// ),
// ),
// component(
// Icons.account_circle_outlined,
// 'User name...',
// false,
// false,
// ),
// component(
// Icons.email_outlined,
// 'Email...',
// false,
// true,
// ),
// component(
// Icons.lock_outline,
// 'Password...',
// true,
// false,
// ),
// Row(
// mainAxisAlignment:
// MainAxisAlignment.spaceAround,
// children: [
// RichText(
// text: TextSpan(
//   text: 'Forgotten password!',
//   style: TextStyle(
//     color: Colors.white,
//   ),
//   recognizer: TapGestureRecognizer()
//     ..onTap = () {
//       HapticFeedback.lightImpact();
//       Fluttertoast.showToast(
//         msg:
//         'Forgotten password! button pressed',
//       );
//     },
// ),
// ),
//   RichText(
//     text: TextSpan(
//       text: 'Create a new Account',
//       style: TextStyle(
//         color: Colors.white,
//       ),
//       recognizer: TapGestureRecognizer()
//         ..onTap = () {
//           HapticFeedback.lightImpact();
//           Fluttertoast.showToast(
//             msg:
//             'Create a new Account button pressed',
//           );
//         },
//     ),
//   ),
// ],
// ),
//   SizedBox(height: size.width * .3),
//   InkWell(
//     splashColor: Colors.transparent,
//     highlightColor: Colors.transparent,
//     onTap: () {
//       HapticFeedback.lightImpact();
//       Fluttertoast.showToast(
//         msg: 'Sign-In button pressed',
//       );
//     },
//     child: Container(
//       margin: EdgeInsets.only(
//         bottom: size.width * .05,
//       ),
//       height: size.width / 8,
//       width: size.width / 1.25,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Colors.black.withOpacity(.1),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         'Sing-In',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 20,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     ),
//   ),
// ],
// ),
//
//



















// import 'package:flutter/material.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:untitled/pages/Home_page.dart';
// import '../constants.dart';
// import '../widgets/orginalbutton.dart';
// import '../widgets/textfiled.dart';
// import 'package:untitled/auth_server.dart';
// class login extends StatelessWidget {
//   const login({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ScrollConfiguration(
//         behavior: ,
//         child: Padding(
//             padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//             child: Column(
//               children: [
//                 SizedBox(height: 8,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   children: [
//                     TextButton(
//                       onPressed: (){
//                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Home()));
//                       },
//                       child: Text('Skip',
//                         style: TextStyle(color: Colors.grey),)),
//                   ], ),
//
//                 //logo image
//                const Image(image: AssetImage(logoimage), ),
//
//                   //email filed
//                   textform(myicon:const Icon(Icons.email_outlined,color: kPrimaryColor),
//                     hinttext:"البريد الالكتروني" ,
//                   ),
//                //password field
//                const SizedBox(height: 15),
//                 textform(myicon:const Icon(Icons.key_outlined,color: kPrimaryColor),
//                   hinttext:"الرمز السري" ,
//                   suffixIcon:const Icon(Icons.remove_red_eye,color: kPrimaryColor) ,
//                 ),
//
//                const SizedBox(height:40),
//                 Container(
//                     margin:const EdgeInsets.symmetric(horizontal: 21),
//                     height: 40,
//                     width: double.infinity,
//                     child: orginalButton(text: 'تسجيل الدخول', onPressed: (){})),
//
//                 const SizedBox(height:15),
//                 Container(
//                     margin:const EdgeInsets.symmetric(horizontal: 21),
//                     height: 40,
//                     width: double.infinity,
//                     child: GestureDetector(
//                       onTap:() {
//                         AuthServic().signInWithGoogle();
//                       },
//                       child: Text('Google',style: TextStyle(color: Colors.deepPurple)),
//                       // child: orginalButton(text: 'تسجيل الدخول بأستخدام جوجل',
//                       //     onPressed: () {}
//                       //),
//                     ))
//
//               ],
//             ),
//         ),
//       ),
//     );
//   }
// }

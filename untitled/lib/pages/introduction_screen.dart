import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/pages/login_page.dart';



class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

// creating List of Slide objects
// to store data of all intro slides
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();

    // initializing slides at
    // the runtime of app
    slides.add(
       Slide(
        title: "GeeksForGeeks ",
        maxLineTitle: 2,
        styleTitle:const TextStyle(
          color: Colors.black,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
        description:
        "GeeksForGeeks present you the intro_slider tutorial making your learning phase Easier.",
      styleDescription: TextStyle(
        color: Colors.black,
        fontSize: 20.0,
      ),
      centerWidget: Image(image: AssetImage('assest/images/intro1.png')),
      marginDescription:
      EdgeInsets.only(left: 20.0,
          right: 20.0,
          top: 20.0,
          bottom: 70.0),
      backgroundColor: Colors.white,
      directionColorBegin: Alignment.topLeft,
      directionColorEnd: Alignment.bottomRight,
      onCenterItemPress: () {},
      //   widgetDescription: Image(image: AssetImage('assest/images/img3.jpg'))
    ),
    );
    slides.add(
     Slide(
    title: "Second Slide",
    styleTitle: TextStyle(
    color: Colors.black,
    fontSize: 30.0,
    fontWeight: FontWeight.bold,
    ),
    description: "Do video call anywhere anytime with this app.",
       centerWidget: Image(image: AssetImage('assest/images/intro2.png')),

       styleDescription: TextStyle(
    color: Colors.black,
    fontSize: 20.0,
    ),
       backgroundColor: Colors.white,
       directionColorBegin: Alignment.topRight,
       directionColorEnd: Alignment.bottomLeft,
    ),
    );
    slides.add(
     Slide(
    title: "Third Slide",
     styleTitle:const TextStyle(
     color: Colors.black,
     fontSize: 30.0,
     fontWeight: FontWeight.bold,
    ),
    description: "Now track the location with this app easily.",
       centerWidget: Image(image: AssetImage('assest/images/intro3.png')),
       styleDescription:const TextStyle(
    color: Colors.white,
    fontSize: 20.0,
    ),
       backgroundColor: Colors.white,
       directionColorBegin: Alignment.topCenter,
       directionColorEnd: Alignment.bottomCenter,
       maxLineTextDescription: 3,
    // centerWidget: Image(image: AssetImage("assest/images/img5.jpg"))
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return  IntroSlider(

      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => login(),));
          },
          child:const Text(
            "Skip",
            style: TextStyle(fontSize: 20,color:kPrimaryColor),
          )),

      // Next button
      renderNextBtn:const Icon(
        Icons.navigate_next,
        color: kPrimaryColor,
        size: 40.0,
      ),
      // Done button
      renderDoneBtn: TextButton(
          onPressed: () {},
          child:const Text("Done",
              style: TextStyle(fontSize: 20,color: kPrimaryColor,))),

      // Dot indicator
      colorDot: kPrimaryColor,
      colorActiveDot: Colors.grey,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.black,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/pages/navbar/Home_page.dart';
import 'package:untitled/pages/navbar/favPage.dart';
import 'package:untitled/pages/navbar/profilePage.dart';
import 'package:untitled/pages/navbar/searchpage.dart';

class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  State<mainPage> createState() => _pagesState();
}

class _pagesState extends State<mainPage> {

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List pages= [
    Home(),
    favPage(),
    searchPage(),
    profilePage(),
  ];


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: pages[_selectedIndex],

        bottomNavigationBar: Container(
        margin: EdgeInsets.all(8),
    height: screenWidth * .155,
    decoration: BoxDecoration(
    color: kPrimaryColor,
    boxShadow: [
    BoxShadow(
    color: Colors.black.withOpacity(.15),
    blurRadius: 30,
    offset: Offset(0, 10),
    ),
    ],
    borderRadius: BorderRadius.circular(50),
    ),
    child: ListView.builder(
    itemCount: 4,
    scrollDirection: Axis.horizontal,
    padding: EdgeInsets.symmetric(horizontal: screenWidth * .024),
    itemBuilder: (context, index) => InkWell(
    onTap: () {
    setState(() {
      _selectedIndex = index;
    HapticFeedback.lightImpact();
    });
    },
    splashColor: Colors.white38,
    highlightColor: Colors.white,
    child: Stack(
    children: [
    SizedBox(
    width: screenWidth * .2125,
    child: Center(
    child: AnimatedContainer(
    duration: Duration(seconds: 1),
    curve: Curves.fastLinearToSlowEaseIn,
    height: index == _selectedIndex ? screenWidth * .12 : 0,
    width: index == _selectedIndex ? screenWidth * .2125 : 0,
    decoration: BoxDecoration(
    color: index == _selectedIndex
    ? Colors.black26
        : Colors.white,
    borderRadius: BorderRadius.circular(50),
    ),
    ),
    ),
    ),
    Container(
    width: screenWidth * .2125,
    alignment: Alignment.center,
    child: Icon(
    listOfIcons[index],
    size: screenWidth * .076,
    color: index == _selectedIndex
    ? Colors.white
        : Colors.black26,
    ),
    ),
    ],
    ),
    ),
    ),)
    );
  }

  List<IconData> listOfIcons = [
    Icons.apps_outlined,
    Icons.favorite_rounded,
    Icons.search_outlined,
    Icons.person_rounded,
  ];
}

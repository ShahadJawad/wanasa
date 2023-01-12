import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/pages/navbar/Home_page.dart';
import 'package:untitled/pages/navbar/fav/favPage.dart';
import 'package:untitled/pages/navbar/searchpage.dart';

import '../constants.dart';
import 'navbar/profile/profile_screen.dart';

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
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body:  pages[_selectedIndex],


        bottomNavigationBar:Container(
          margin: EdgeInsets.all(0),
          height: size.width * .155,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10),
              ),
            ],
            //borderRadius: BorderRadius.circular(50),
          ),
          child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: size.width * .024),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                setState(
                      () {
                        _selectedIndex = index;
                  },
                );
              },
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 1500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    margin: EdgeInsets.only(
                      bottom: index == _selectedIndex ? 0 : size.width * .029,
                      right: size.width * .0422,
                      left: size.width * .0422,
                    ),
                    width: size.width * .128,
                    height: index == _selectedIndex ? size.width * .014 : 0,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(10),
                      ),
                    ),
                  ),
                  Icon(
                    listOfIcons[index],
                    size: size.width * .076,
                    color: index == _selectedIndex
                        ?kPrimaryColor
                        : Colors.black38,
                  ),
                  SizedBox(height: size.width * .03),
                ],
              ),
            ),
          ),
        ),


    );
  }

  List<IconData> listOfIcons = [
    Icons.apps_outlined,
    Icons.favorite_rounded,
    Icons.search_outlined,
    Icons.person_rounded,
  ];
}

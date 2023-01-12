import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/constants.dart';
import 'package:get/get.dart';
// import '../../../widgets/favirate.dart.dart';
import '../../../widgets/favirate.dart';
import '../../details/detailPage.dart';
import 'controller.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class favPage extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<favPage> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  late AnimationController _animationController;

  List favoritePlaces = [];

  Color _colorHeart = Colors.red;

  // @override
  // void initState() {
  //   _animationController =
  //       AnimationController(vsync: this, duration: Duration(milliseconds: 850));
  //
  //   Timer(Duration(milliseconds: 200), () => _animationController.forward());
  //   //
  //   // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //   //   fetchDatabaseList();
  //   // });
  //   super.initState();
  // }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  // fetchDatabaseList() async {
  //   dynamic resultPlaces = await DataManager().getFavoriteScreenPlacesList();
  //   if (resultPlaces == null) {
  //   } else {
  //     setState(() {
  //       favoritePlaces = resultPlaces;
  //     });
  //   }
  // }

  Tween<Offset> _offset = Tween(begin: Offset(3, 0), end: Offset(0, 0));
  var data;

  getData() async {
    FirebaseFirestore.instance.collection('places').where('fav', isEqualTo: true).get().then((value) {
      setState(() {
        data = value.docs;
      });
    });
  }

  @override
  void initState() {
    getData();
    _animationController =
          AnimationController(vsync: this, duration: Duration(milliseconds: 850));

    super.initState();
  }

  //logic//
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 1;

    return data == null

        ? Center(
      child: CircularProgressIndicator(),
    )

        : AnimationLimiter(
      child: GridView.count(
        physics: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),

        padding: EdgeInsets.all(20),
        childAspectRatio: 2,

        crossAxisCount: columnCount,
        children: List.generate(
          //عدد الكارت
          data.length,
              (int index) {
            return AnimationConfiguration.staggeredGrid(
              position: index,
              duration: Duration(milliseconds: 500),
              columnCount: columnCount,
              child: ScaleAnimation(
                duration: Duration(milliseconds: 900),
                curve: Curves.fastLinearToSlowEaseIn,
                child: FadeInAnimation(
                  //card
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => detailsPage(
                          data: data[index].data(),
                        ),
                      ));
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                          top: 8, right: 5, left: 5),
                      height: 90, width: 120,
                      //color: kPrimaryColor,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                            image: NetworkImage(
                                data[index].data()['img_path']?? " "),
                            fit: BoxFit.fill),
                      ),

                      //shado
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Colors.black26,
                          borderRadius:
                          BorderRadius.all(Radius.circular(20)),
                        ),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //fav button
                            Container(
                              margin: EdgeInsets.only(top: 5, right: 5),
                              height: 30,
                              width: 30,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white60),
                              child: LikeButton(
                                  idd: data[index].reference.id,
                                  dataa:  data[index].data()),
                            ),

                            // اسم المكان
                            Container(
                              alignment: Alignment.bottomRight,
                              child: Text(
                                data[index].data()['name']?? " ",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


}


class favcard extends StatefulWidget {
  const favcard({Key? key}) : super(key: key);

  @override
  State<favcard> createState() => _MyCustomWidgetState();
}


class _MyCustomWidgetState extends State<favcard> {
  String TapToExpandIt = 'Tap to Expand it';
  String Sentence = 'Widgets that have global keys reparent their subtrees when'
      ' they are moved from one location in the tree to another location in the'
      ' tree. In order to reparent its subtree, a widget must arrive at its new'
      ' location in the tree in the same animation frame in which it was removed'
      ' from its old location the tree.'
      ' Widgets that have global keys reparent their subtrees when they are moved'
      ' from one location in the tree to another location in the tree. In order'
      ' to reparent its subtree, a widget must arrive at its new location in the'
      ' tree in the same animation frame in which it was removed from its old'
      ' location the tree.';
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
    children: [
      InkWell(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
          },
          child:  AnimatedContainer(
            margin: EdgeInsets.symmetric(
              horizontal: isExpanded ? 20 : 10,
              vertical: 20,
            ),
            padding: EdgeInsets.all(8),
            height: isExpanded ? 100 : 330,
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 1200),
            decoration: BoxDecoration(
              color:kPrimaryColor,
              borderRadius: BorderRadius.all(
                Radius.circular(isExpanded ? 20 : 20),
              ),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [

                   Container(
                     height: 80,width: 80,
                     decoration: BoxDecoration(
                       image: const DecorationImage(
                           image: AssetImage('assest/images/img4.jpg'),
                           fit: BoxFit.fill),
                       borderRadius: BorderRadius.circular(10)

                     ),
                      ),
                    Icon(
                      isExpanded
                          ? Icons.keyboard_arrow_down
                          : Icons.keyboard_arrow_up,
                      color: Colors.white,
                      size: 27,
                    ),
                  ],
                ),
                isExpanded ? SizedBox() : SizedBox(height: 20),
                AnimatedCrossFade(
                  firstChild: const Text(
                    '',
                    style: TextStyle(
                      fontSize: 0,
                    ),
                  ),
                  secondChild:const  Text(
                    'shahad',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.7,
                    ),
                  ),
                  crossFadeState: isExpanded
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 1200),
                  reverseDuration: Duration.zero,
                  sizeCurve: Curves.fastLinearToSlowEaseIn,
                ),
              ],
            ),
          ),
    ),

    ],
        ),
    );
  }
}



  //
  // Widget _buildItem(BuildContext item, Animation animation, int index) {
  //   Size size = MediaQuery.of(context).size;
  //
  //   return SlideTransition(
  //       position: animation.drive(_offset),
  //       child: SlideTransition(
  //           position: _animationController.drive(_offset),
  //           //  scale: _animationController,
  //           // alignment: _animationController,
  //           // sizeFactor: animation,
  //           // opacity: _animationController,
  //           child: Align(
  //               heightFactor: 1.1,
  //               child: InkWell(
  //                   onTap: () {
  //                     // Navigator.of(context).push(MaterialPageRoute(
  //                     //     builder: (BuildContext context) => new Details(
  //                     //       place_ID: favoritePlaces[index]['place_ID'],
  //                     //       place: favoritePlaces[index]['place_name'],
  //                     //       img: favoritePlaces[index]['place_image_1'],
  //                     //       country: favoritePlaces[index]['place_city'],
  //                     //       desc: favoritePlaces[index]
  //                     //       ['place_description'],
  //                     //       way: favoritePlaces[index]['place_way'],
  //                     //       lat: favoritePlaces[index]['place_lat'],
  //                     //       lng: favoritePlaces[index]['place_lng'],
  //                     //     )));
  //                   },
  //                   child: Container(
  //                     height: size.height * 0.15,
  //                     width: size.width * 0.88,
  //                     decoration: BoxDecoration(
  //                         color: Colors.white,
  //                         borderRadius: BorderRadius.circular(14.0)),
  //                     child: Row(
  //                       children: [
  //                         Padding(
  //                             padding: EdgeInsets.only(left: size.width * 0.04),
  //                             child: Container(
  //                                 height: size.height * 0.10,
  //                                 width: size.width * 0.23,
  //                                 child: ClipRRect(
  //                                     borderRadius: BorderRadius.circular(8.0),
  //                                     child: Image.network(
  //                                       favoritePlaces[index]['place_image_1'],
  //                                       fit: BoxFit.fill,
  //                                     )))),
  //                         Padding(
  //                           padding: EdgeInsets.only(
  //                               left: size.width * 0.03,
  //                               top: size.height * 0.022),
  //                           child: Row(
  //                             children: [
  //                               Padding(
  //                                   padding: EdgeInsets.only(
  //                                       top: size.height * 0.007),
  //                                   child: Column(
  //                                     mainAxisAlignment:
  //                                     MainAxisAlignment.start,
  //                                     crossAxisAlignment:
  //                                     CrossAxisAlignment.start,
  //                                     children: [
  //                                       Text(
  //                                         favoritePlaces[index]["place_name"],
  //                                         style: TextStyle(
  //                                             fontSize: 21,
  //                                             fontFamily: "Barlow",
  //                                             fontWeight: FontWeight.w600),
  //                                       ),
  //                                       Row(
  //                                         children: [
  //                                           Container(
  //                                             height: size.height * 0.05,
  //                                             width: size.width * 0.36,
  //                                             // child: StarsWidget(
  //                                             //     rating: double.parse(
  //                                             //         favoritePlaces[index]
  //                                             //         ["rating"])),
  //                                           ),
  //                                           Padding(
  //                                             padding: EdgeInsets.only(
  //                                                 top: size.height * 0.011),
  //                                             child: Container(
  //                                               height: size.height * 0.04,
  //                                               width: size.width * 0.059,
  //                                               child: Text(
  //                                                 favoritePlaces[index]
  //                                                 ["rating"],
  //                                                 style: const TextStyle(
  //                                                     fontFamily: "Barlow",
  //                                                     fontSize: 14,
  //                                                     color: Colors.grey,
  //                                                     fontWeight:
  //                                                     FontWeight.w600),
  //                                               ),
  //                                             ),
  //                                           )
  //                                         ],
  //                                       ),
  //                                     ],
  //                                   )),
  //                             ],
  //                           ),
  //                         ),
  //                         Padding(
  //                             padding: EdgeInsets.only(
  //                                 right: size.width * 0.0, bottom: 1),
  //                             child: Container(
  //                               child: IconButton(
  //                                 icon:  Icon(
  //                                  Icons.favorite_outline_sharp,
  //                                   color: _colorHeart,
  //                                 ),
  //                                 color: Colors.red,
  //                                 onPressed: () {
  //                                   // DataManager().deletePlaceFromFavorite(
  //                                   //     favoritePlaces[index]["place_ID"]);
  //                                   // _removeSingleItems(index);
  //                                 },
  //                               ),
  //                             ))
  //                       ],
  //                     ),
  //                   )))));
  // }

  // void _removeSingleItems(int indexToRemove) {
  //   if (indexToRemove != favoritePlaces.length - 1) {
  //     AnimatedListRemovedItemBuilder builder = (context, animation) {
  //       return _buildItem(context, animation, indexToRemove);
  //     };
  //     favoritePlaces.removeAt(indexToRemove);
  //     _key.currentState.removeItem(indexToRemove, builder);
  //   } else {
  //     AnimatedListRemovedItemBuilder builder = (context, animation) {
  //       return _buildItem(context, animation, indexToRemove);
  //     };
  //     _key.currentState.removeItem(indexToRemove, builder);
  //   }


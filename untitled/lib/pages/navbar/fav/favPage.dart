import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../widgets/favirate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../widgets/loading.dart';

class favPage extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<favPage> with SingleTickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  late AnimationController _animationController;

  List favoritePlaces = [];
  bool isExpanded = true;
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

  void _launchURL(url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }

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


    return data == null

        ? Center(
      child: loadindWidget(),
    )

        : Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        systemOverlayStyle:SystemUiOverlayStyle(statusBarColor: Colors.black),
        elevation: 0.0,
        automaticallyImplyLeading: false,
        backgroundColor: kPrimaryColor,
        title: const Text('المفضلات ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Assistant",
              fontSize: 21,
              fontWeight: FontWeight.bold,
            )),
      ),
          body: StreamBuilder (

            builder: (context, snapshot) {

              return ListView.builder(

                itemCount: data.length,
                physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemBuilder: (BuildContext context, int index) {
                  return  InkWell(
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
                      height: isExpanded ? 100 : 180,
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

                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 10),
                                    height: 80,width: 80,
                                    decoration: BoxDecoration(
                                        image:  DecorationImage(
                                            image:NetworkImage(
                                                data[index].data()['img_path']?? " "
                                            ),
                                            fit: BoxFit.fill
                                        ),
                                        borderRadius: BorderRadius.circular(10)
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index].data()['name'],
                                        style:const TextStyle(
                                            fontSize: 15,
                                            color: Colors.white,

                                            fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      Text(
                                        data[index].data()['city'],
                                        style:const TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          // fontWeight: FontWeight.w800
                                        ),
                                      ),
                                    ],
                                  )
                                ],
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
                            secondChild:Column(
                              children: [
                                const  Divider(height: 14,),

                                Container(
                                  margin:const EdgeInsets.only(top: 5),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                    children: [
                                      LikeButton(
                                        idd:  data[index].reference.id,
                                        dataa:  data[index].data(),
                                      ),

                                      InkWell(
                                        onTap: () => _launchURL(data['location']?? " "),
                                        child: const Icon(
                                          Icons.location_on_sharp,
                                          color: Colors.white,

                                        ),
                                      ),

                                      InkWell(
                                        onTap: (){},
                                        child: const Icon(
                                          Icons.share,
                                          color: Colors.white,
                                        ),
                                      ),


                                    ],),
                                )
                              ],
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
                  );
                },




              );
            },

          ),
        );
  }


}
























//
// class favcard extends StatefulWidget {
//   const favcard({Key? key}) : super(key: key);
//
//   @override
//   State<favcard> createState() => _MyCustomWidgetState();
// }
//
//
//
//
// class _MyCustomWidgetState extends State<favcard> {
//   String TapToExpandIt = 'Tap to Expand it';
//   String Sentence = 'Widgets that have global keys reparent their subtrees when'
//       ' they are moved from one location in the tree to another location in the'
//       ' tree. In order to reparent its subtree, a widget must arrive at its new'
//       ' location in the tree in the same animation frame in which it was removed'
//       ' from its old location the tree.'
//       ' Widgets that have global keys reparent their subtrees when they are moved'
//       ' from one location in the tree to another location in the tree. In order'
//       ' to reparent its subtree, a widget must arrive at its new location in the'
//       ' tree in the same animation frame in which it was removed from its old'
//       ' location the tree.';
//   bool isExpanded = true;
//
//   var data;
//
//   getData() async {
//     FirebaseFirestore.instance.collection('places').where('fav', isEqualTo: true).get().then((value) {
//       setState(() {
//         data = value.docs;
//       });
//     });
//   }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: ListView.builder(
//
//         physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
//     itemBuilder: (BuildContext context, int index) {
//           return  InkWell(
//             highlightColor: Colors.transparent,
//             splashColor: Colors.transparent,
//             onTap: () {
//               setState(() {
//                 isExpanded = !isExpanded;
//               });
//             },
//             child:  AnimatedContainer(
//               margin: EdgeInsets.symmetric(
//                 horizontal: isExpanded ? 20 : 10,
//                 vertical: 20,
//               ),
//               padding: EdgeInsets.all(8),
//               height: isExpanded ? 100 : 330,
//               curve: Curves.fastLinearToSlowEaseIn,
//               duration: Duration(milliseconds: 1200),
//               decoration: BoxDecoration(
//                 color:kPrimaryColor,
//                 borderRadius: BorderRadius.all(
//                   Radius.circular(isExpanded ? 20 : 20),
//                 ),
//               ),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       Container(
//                         height: 80,width: 80,
//                         decoration: BoxDecoration(
//                             image:  DecorationImage(
//                               image:NetworkImage(
//                                   data[index].data()['img_path']?? " "),
//                             ),
//                             borderRadius: BorderRadius.circular(10)
//
//                         ),
//                       ),
//                       Icon(
//                         isExpanded
//                             ? Icons.keyboard_arrow_down
//                             : Icons.keyboard_arrow_up,
//                         color: Colors.white,
//                         size: 27,
//                       ),
//                     ],
//                   ),
//                   isExpanded ? SizedBox() : SizedBox(height: 20),
//                   AnimatedCrossFade(
//                     firstChild: const Text(
//                       '',
//                       style: TextStyle(
//                         fontSize: 0,
//                       ),
//                     ),
//                     secondChild:const  Text(
//                       'shahad',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 15.7,
//                       ),
//                     ),
//                     crossFadeState: isExpanded
//                         ? CrossFadeState.showFirst
//                         : CrossFadeState.showSecond,
//                     duration: Duration(milliseconds: 1200),
//                     reverseDuration: Duration.zero,
//                     sizeCurve: Curves.fastLinearToSlowEaseIn,
//                   ),
//                 ],
//               ),
//             ),
//           );
//     },
//
//
//
//
//         ),
//     );
//   }
// }



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

//data[index].data()['img_path']?? " "
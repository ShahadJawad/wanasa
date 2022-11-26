import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_tester/API/DataManager.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';

import '../details/detailRecomPage.dart';

class favPage extends StatefulWidget {
  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<favPage> with TickerProviderStateMixin {
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();

  late AnimationController _animationController;

  List favoritePlaces = [];

  Color _colorHeart = Colors.red;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 850));

    Timer(Duration(milliseconds: 200), () => _animationController.forward());
    //
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   fetchDatabaseList();
    // });
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;

    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          title: Text('Favorites',
              style: TextStyle(
                color: Colors.black,
                fontFamily: "Assistant",
                fontSize: 21,
                fontWeight: FontWeight.bold,
              )),
        ),
        body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.grey[200],
                child: Column(children: [

                  SizedBox(
                    height: 20,
                  ),
           InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => detailsPage()));
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  border: Border.all(
                      color: Colors.white.withOpacity(.1), width: 1)),
              child: Padding(
                padding: EdgeInsets.all(_w / 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: _w / 3,
                      width: _w / 3,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image(
                          image: AssetImage(imagelist[1].myimage),
                          fit: BoxFit.fill,

                        ),
                      ),
                    ),


                    SizedBox(
                      width: _w / 2.05,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(' اسم المكان',
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: _w / 20,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              wordSpacing: 1,
                            ),
                          ),
                          Text(
                            'المدينه',
                            maxLines: 1,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.white.withOpacity(1),
                              fontSize: _w / 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),

                        ],
                      ),
                    ),
                    InkWell(
                   onTap: () {},
                        child:const Icon(Icons.favorite,color: Colors.red,size: 30,))
                  ],
                ),
              ),
            ),
          ),

                  // Expanded(
                  //     child: favoritePlaces.isEmpty
                  //         ? Padding(
                  //       padding:
                  //       EdgeInsets.only(bottom: size.height * 0.3),
                  //       child: Image.asset(imagelist[1].myimage),
                  //     )
                  //         : AnimatedList(
                  //         key: _key,
                  //         initialItemCount: favoritePlaces.length,
                  //         itemBuilder: (context, index, animation) {
                  //           return _buildItem(
                  //               context, _animationController, index);
                  //         })),
                ]))));
  }

  Widget _buildItem(BuildContext item, Animation animation, int index) {
    Size size = MediaQuery.of(context).size;

    return SlideTransition(
        position: animation.drive(_offset),
        child: SlideTransition(
            position: _animationController.drive(_offset),
            //  scale: _animationController,
            // alignment: _animationController,
            // sizeFactor: animation,
            // opacity: _animationController,
            child: Align(
                heightFactor: 1.1,
                child: InkWell(
                    onTap: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (BuildContext context) => new Details(
                      //       place_ID: favoritePlaces[index]['place_ID'],
                      //       place: favoritePlaces[index]['place_name'],
                      //       img: favoritePlaces[index]['place_image_1'],
                      //       country: favoritePlaces[index]['place_city'],
                      //       desc: favoritePlaces[index]
                      //       ['place_description'],
                      //       way: favoritePlaces[index]['place_way'],
                      //       lat: favoritePlaces[index]['place_lat'],
                      //       lng: favoritePlaces[index]['place_lng'],
                      //     )));
                    },
                    child: Container(
                      height: size.height * 0.15,
                      width: size.width * 0.88,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(14.0)),
                      child: Row(
                        children: [
                          Padding(
                              padding: EdgeInsets.only(left: size.width * 0.04),
                              child: Container(
                                  height: size.height * 0.10,
                                  width: size.width * 0.23,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        favoritePlaces[index]['place_image_1'],
                                        fit: BoxFit.fill,
                                      )))),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.03,
                                top: size.height * 0.022),
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: size.height * 0.007),
                                    child: Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.start,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          favoritePlaces[index]["place_name"],
                                          style: TextStyle(
                                              fontSize: 21,
                                              fontFamily: "Barlow",
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              height: size.height * 0.05,
                                              width: size.width * 0.36,
                                              // child: StarsWidget(
                                              //     rating: double.parse(
                                              //         favoritePlaces[index]
                                              //         ["rating"])),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: size.height * 0.011),
                                              child: Container(
                                                height: size.height * 0.04,
                                                width: size.width * 0.059,
                                                child: Text(
                                                  favoritePlaces[index]
                                                  ["rating"],
                                                  style: const TextStyle(
                                                      fontFamily: "Barlow",
                                                      fontSize: 14,
                                                      color: Colors.grey,
                                                      fontWeight:
                                                      FontWeight.w600),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(
                                  right: size.width * 0.0, bottom: 1),
                              child: Container(
                                child: IconButton(
                                  icon:  Icon(
                                   Icons.favorite_outline_sharp,
                                    color: _colorHeart,
                                  ),
                                  color: Colors.red,
                                  onPressed: () {
                                    // DataManager().deletePlaceFromFavorite(
                                    //     favoritePlaces[index]["place_ID"]);
                                    // _removeSingleItems(index);
                                  },
                                ),
                              ))
                        ],
                      ),
                    )))));
  }

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

}
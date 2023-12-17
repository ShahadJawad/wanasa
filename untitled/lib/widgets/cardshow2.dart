import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/pages/details/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:untitled/widgets/loading.dart';
import '../constants.dart';
import 'favWidget.dart';
import 'package:url_launcher/url_launcher.dart';


class cardShow2 extends StatefulWidget {
  const cardShow2({super.key});
  @override
  State<cardShow2> createState() => _cardShowState();
}

class _cardShowState extends State<cardShow2> with SingleTickerProviderStateMixin {
  //logic//
  late final AnimationController _controller = AnimationController(
      duration: const Duration(milliseconds: 200), vsync: this, value: 1.0);

  bool _isFavorite = false;
  var data;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  getData() async {
    FirebaseFirestore.instance.collection('places').where("category" , isEqualTo:3).get().then((value) {
      setState(() {
        data = value.docs;
      });
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  //logic//
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    int columnCount = 2;

    return data == null

        ? Center(
      child: loadindWidget(),
    )

        : AnimationLimiter(
      child: GridView.count(
        physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics()),
        padding: EdgeInsets.all(_w / 70),
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
                              margin:const EdgeInsets.only(top: 5, right: 5),
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



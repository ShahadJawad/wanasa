import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/pages/details/detailPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'favWidget.dart';

class cardShow extends StatefulWidget {
  const cardShow({super.key});
  @override
  State<cardShow> createState() => _cardShowState();
}

class _cardShowState extends State<cardShow> {
  //logic//
  var data;
  getData() async {
    FirebaseFirestore.instance.collection('places').get().then((value) {
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
            child: CircularProgressIndicator(),
          )
        : AnimationLimiter(
            child: GridView.count(
              physics: BouncingScrollPhysics(
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
                                      data[index].data()['img_path']),
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
                                    child: LikeButton(),
                                  ),

                                  // اسم المكان
                                  Container(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      data[index].data()['name'],
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




// import 'package:flutter/material.dart';
// import 'package:untitled/pages/details/detailPage.dart';
// import 'package:untitled/widgets/stars.dart';
// import '../db/mydb.dart';
// import '../lists/list1.dart';
// class cardShow extends StatefulWidget {
//   const cardShow({Key? key}) : super(key: key);
//
//   @override
//   State<cardShow> createState() => _cardShowState();
// }
//
// class _cardShowState extends State<cardShow> {
//
//   SqlDb sqLDb = SqlDb();
//
//   Future<List<Map>> readData() async{
//     var response = await sqLDb.readData("SELECT * FROM places");
//     return response ;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Flexible(
//         child: FutureBuilder(
//           future: readData(),
//     builder: (BuildContext context ,AsyncSnapshot<List<Map>> snapshot){
//
//       if (snapshot.hasData) {
//         return ListView.builder(
//             scrollDirection: Axis.vertical,
//             itemCount:  snapshot.data!.length,
//             shrinkWrap: true,
//             itemBuilder: (context, index) =>
//                 InkWell(
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => detailsPage()));
//                     },
//                     child: Container(
//                       padding: const EdgeInsets.only(right: 8, left: 6),
//                       height: 210,
//                       width: 150,
//                       margin: const EdgeInsets.symmetric(
//                           vertical: 5, horizontal: 10),
//                       decoration: BoxDecoration(
//                         //border: Border(),
//                         borderRadius: BorderRadius.circular(100),
//                         //     image: DecorationImage(image: AssetImage(imagelist[index].myimage,),
//                         //       fit: BoxFit.fill
//                         // ),
//                       ),
//
//                       //الصوره والاسم
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//
//                           //الصوره
//                           Container(
//                             height: 150,
//                             decoration: BoxDecoration(
//                                 borderRadius: const BorderRadius.only(
//                                     topLeft: Radius.circular(15),
//                                     topRight: Radius.circular(15)
//                                 ),
//                                 image: DecorationImage(
//                                   image: AssetImage(imagelist[index].myimage),
//                                   fit: BoxFit.fill,)
//                             ),
//                           ),
//

//                           //الاسم و التقييم
//                           Container(
//                             padding: EdgeInsets.symmetric(vertical: 5),
//                             decoration: const BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.only(
//                                     bottomRight: Radius.circular(10),
//                                     bottomLeft: Radius.circular(10))
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                  Text(
//                                   "${snapshot.data![index]['placeName']}",
//                                   textAlign: TextAlign.end,
//                                   style:const TextStyle(
//                                       color: Colors.black,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 18,
//                                   ),
//                                  ),
//                                 stars(mysizs: 20,)
//                               ],
//                             ),
//                           ),
//
//
//                         ],
//                       ),
//                     )
//                 )
//         );
//       }
//       return Center(child: CircularProgressIndicator());
//
//     }
//         ),
//       );
//   }
// }

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:untitled/constants.dart';

import '../../widgets/favWidget.dart';
import '../../widgets/stars.dart';

class detailsPage extends StatelessWidget {
  final data;
  detailsPage({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: h / 2,
            width: double.infinity,
            child: Image(
              image: NetworkImage(data['img_path']),
              fit: BoxFit.cover,
            ),
          ),
          buttonArrow(context),
          scroll(),
        ],
      ),

      //Nav Bar
      bottomNavigationBar: Container(
        height: 65,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20))),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // find place
            Container(
              margin: EdgeInsets.only(right: 10),
              height: 45,
              width: 120,
              decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(' أذهب للمكان',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold)),
                    Icon(
                      Icons.place,
                      color: Colors.white,
                      size: 23,
                    )
                  ]),
            ),

            // fav and share
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10),
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: LikeButton(),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Icon(
                    Icons.share,
                    color: kPrimaryColor,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    ));
  }

  buttonArrow(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),

      //image
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          clipBehavior: Clip.hardEdge,
          height: 55,
          width: 55,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
          ),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(
              height: 55,
              width: 55,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  //scroll
  scroll() {
    return DraggableScrollableSheet(
        initialChildSize: 0.6,
        maxChildSize: 1.0,
        minChildSize: 0.6,
        builder: (context, scrollController) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20)),
            ),
            child: SingleChildScrollView(
              controller: scrollController,

              //body
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // -
                  Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 5,
                          width: 35,
                          color: Colors.black12,
                        ),
                      ],
                    ),
                  ),

                  // اسم المكان والتقييم
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'اسم المكان \n ,${data['name']}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        stars(
                          mysizs: 22.0,
                        )
                      ],
                    ),
                  ),

                  // الفصل والوصف
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8, top: 8),
                          child: Text(
                            data['category'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            data['description'],
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ])
                ],
              ),
            ),
          );
        });
  }
}













// import 'package:flutter/material.dart';
// import 'package:untitled/constants.dart';
// import 'package:untitled/widgets/stars.dart';
//
// import '../../lists/list1.dart';
//
// class detailsPage extends StatefulWidget {
//   const detailsPage({Key? key}) : super(key: key);
//
//   @override
//   State<detailsPage> createState() => _detailsPageState();
// }
//
// class _detailsPageState extends State<detailsPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:   Colors.grey.shade100,
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             Stack(
//               children: [
//
//                 //الصوره
//                 Container(
//                 height: MediaQuery.of(context).size.height / 2,
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                  image: DecorationImage(image: AssetImage(imagelist[3].myimage),
//                      fit: BoxFit.fill),
//                 ),
//               ),
//
//                 //التفاصيل
//
//                     SingleChildScrollView(
//                       child: Container(
//                       margin: EdgeInsets.only(top:MediaQuery.of(context).size.height / 2.2 ),
//                       height:  420, width: double.infinity,
//                       decoration: BoxDecoration(
//                           color: Colors.grey.shade100,
//                           borderRadius:const BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
//                       ),
//                       child: Column(
//                         children: [
//
//                       //اسم المكان والتقييم
//                           Container(
//                             padding:const EdgeInsets.only(right: 20,top: 10,left: 20),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const Text('اسم المكان \n ,البصره',
//                                   style: TextStyle(
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 20
//                             ),),
//
//                                 stars(mysizs: 22.0,)
//                               ],
//                          ),
//                           ),
//
//                           // الفصل والوصف
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding:const EdgeInsets.only(right: 8,top: 8),
//                                     child: const Text('صيفي',
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 24
//                                       ),),
//                                   ),
//                                   Container(
//                                     padding:const EdgeInsets.all(10),
//                                     child:const Text(' من أجمل وأحلى شوارع مدينة البصرة والعراق يمتد بمحاذاة شط العرب امتدادا من مصب نهر العشار في شط العرب شمالا ويمتد مرورا ب فندق البصرة الدولي وكازينو البدر حتى مبنى المستشفى التعليمي في منطقة البراضعية جنوبا.',
//                                       style: TextStyle( fontSize: 16),
//                                     ),
//
//                                   )
//                             ],
//                           ),
//                         ],
//                       ),
//                   ),
//                     ),
//                 Container(
//                   margin: EdgeInsets.only(top: MediaQuery.of(context).size.height- 65),
//                   height: 65,width:double.infinity,
//                    decoration: BoxDecoration(
//                      color: Colors.grey[200],
//                      borderRadius: BorderRadius.only(topRight: Radius.circular(20),topLeft: Radius.circular(30))
//                    ),
//                   child:Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//
//                       // find place
//                       Container(
//                         margin: EdgeInsets.only(right: 10),
//                         height: 45,width: 120,
//                         decoration: BoxDecoration(
//                           color: kPrimaryColor,
//                           borderRadius: BorderRadius.circular(15)
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: const[
//                           Text(' أذهب للمكان',style:  TextStyle(color: Colors.white ,fontSize: 16,fontWeight: FontWeight.bold)),
//                           Icon(Icons.place,color: Colors.white,size: 23,)
//                         ]),
//                       ),
//
//                       // fav and share
//                       Row(
//                         children: [
//                           Container(
//                             margin: EdgeInsets.only(left: 10),
//                             height: 42,width: 42,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)
//                             ),
//                             child: Icon(Icons.favorite,color: kPrimaryColor,),
//                           ),
//                           Container(
//                             margin: EdgeInsets.only(left: 10),
//                             height: 42,width: 42,
//                             decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10)
//                             ),
//                             child: Icon(Icons.share,color: kPrimaryColor,),
//                           )
//                         ],
//                       )
//
//                     ],
//                   ) ,
//                 )
//               ],)
//           ],
//         ),
//       ),
//
//
//     );
//   }
// }

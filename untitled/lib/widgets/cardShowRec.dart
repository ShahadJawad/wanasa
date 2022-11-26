
import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';

class cardShowRec extends StatefulWidget {
  @override
  _cardShowRecState createState() => new _cardShowRecState();
}

class _cardShowRecState extends State<cardShowRec> {

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;


    return  Flexible(child: SizedBox(
      height: 150,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(top: 8,right: 5,left: 5),
          height: 90,width:120,
          //color: kPrimaryColor,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image:DecorationImage(image:AssetImage( imagelist[index].myimage),fit: BoxFit.fill),
          ),



          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:  Colors.black26,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                //heart icon
                Container(
                  margin: EdgeInsets.only(top: 5,right: 5),
                  height: 30,width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white24
                  ),
                  child:  Icon(Icons.favorite,color: Colors.white60,)),

                // اسم المكان
                Container(
                   alignment: Alignment.bottomRight,
                   child: const Text(' اسم المكان',
                              textAlign: TextAlign.end,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20
                              ),),
                 ),
              ],
            ),
          ),


        );
      },),
    ));
  }
}






// import 'package:flutter/material.dart';
// import 'package:untitled/lists/list1.dart';
// import 'package:untitled/pages/details/detailRecomPage.dart';
// class cardShowRec extends StatelessWidget {
//   const cardShowRec({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Flexible(
//         child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount:5 ,
//             shrinkWrap: true,
//             itemBuilder: (context, index) =>
//                 InkWell(
//                   onTap: (){
//                     Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPage()));
//                   },
//                   child: Container(
//                     height: 80,width: 150,
//                     margin:const EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(25),
//                         image: DecorationImage(image: AssetImage(imagelist2[index].myimage),
//                             fit: BoxFit.fill)),
//                     child: Column(
//                       children: [
//
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               margin: EdgeInsets.only(right: 8,top: 8),
//                               height: 28,width: 70,
//                               decoration: BoxDecoration(
//                                   color: Colors.white24,
//                                   borderRadius: BorderRadius.circular(10)
//                               ),
//                               child:Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [
//                                   const Text('25',style: TextStyle(color: Colors.white)),
//                                   InkWell(
//                                       onTap: () {},
//                                       child: Icon(Icons.favorite,color: Colors.white60,size: 24,)),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         ),
//
//                         // اسم المكان
//                         Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(top: 150),
//                               child: Container(
//                                   decoration:const BoxDecoration(
//                                   ),
//                                   //padding: EdgeInsets.only(top: 150),
//                                   child:const Text(' اسم المكان',
//                                     style: TextStyle(
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 20
//                                     ),)),
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//
//         ),
//       );
//   }
// }

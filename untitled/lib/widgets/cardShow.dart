import 'package:flutter/material.dart';
import 'package:untitled/pages/details/detailRecomPage.dart';
import 'package:untitled/widgets/stars.dart';
import '../lists/list1.dart';
class cardShow extends StatefulWidget {
  const cardShow({Key? key}) : super(key: key);

  @override
  State<cardShow> createState() => _cardShowState();
}

class _cardShowState extends State<cardShow> {
  @override
  Widget build(BuildContext context) {
    return
      Flexible(
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount:5 ,
            shrinkWrap: true,
            itemBuilder: (context, index) =>
                InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPage()));
                  },
                  child: Container(
                    padding:const EdgeInsets.only(right: 8,left: 6),
                    height: 210,width: 150,
                    margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                      //border: Border(),
                        borderRadius: BorderRadius.circular(100),
                    //     image: DecorationImage(image: AssetImage(imagelist[index].myimage,),
                    //       fit: BoxFit.fill
                    // ),
                  ),

                    //الصوره والاسم
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        //الصوره
                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                              borderRadius:const BorderRadius.only(
                                  topLeft: Radius.circular(15),
                                  topRight: Radius.circular(15)
                              ),
                            image: DecorationImage(image: AssetImage(imagelist[index].myimage),
                              fit: BoxFit.fill,)
                          ),
                        ),


                     //الاسم و التقييم
                     Container(
                       padding: EdgeInsets.symmetric(vertical: 5),
                       decoration:const BoxDecoration(
                         color: Colors.white,
                         borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),
                             bottomLeft:Radius.circular(10) )
                       ),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                          const Text(' اسم المكان',
                             textAlign: TextAlign.end,
                             style: TextStyle(
                                 color: Colors.black,
                                 fontWeight: FontWeight.bold,
                                 fontSize: 18
                             ),),
                           stars(mysizs: 20,)
                         ],
                       ),
                     ),


                      ],
                    ),
                )
                )
        ),
      );
  }
}

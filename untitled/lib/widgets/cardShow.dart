import 'package:flutter/material.dart';
import 'package:untitled/pages/details/detailRecomPage.dart';
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
                    padding:const EdgeInsets.only(top: 6,right: 8,left: 6),
                    height: 200,width: 150,
                    margin:const EdgeInsets.symmetric(vertical: 5,horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(image: AssetImage(imagelist[index].myimage),
                            fit: BoxFit.fill)
                    ),


                  ),
                )

        ),
      );
  }
}

import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/pages/showAll/Recommended_pliecse.dart';
import 'package:untitled/pages/details/detailRecomPage.dart';
import 'package:untitled/pages/showAll/public_plieces.dart';
import 'package:untitled/widgets/cardShow.dart';
import 'package:untitled/widgets/cardShowRec.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   // var bucket;
    return  Scaffold(
      backgroundColor: Colors.grey[200],
          body :  Column(
              children:[

            // الصوره والاسم
             Padding(
              padding:const EdgeInsets.only(right: 5,top: 30),
            child: ListTile(
              //title: CircleAvatar(backgroundColor: kPrimaryColor),
              leading:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[
                  Text('وقت الوناسه',style: TextStyle(fontSize: 20,color: kPrimaryColor,fontWeight: FontWeight.bold)),
                  Text('أكتشف البصره',style: TextStyle(fontSize: 13)),
                ],
              ),
              trailing: CircleAvatar(backgroundImage:AssetImage('assest/images/person.jpg') ,radius: 28),
            ),
            ),

            // اول كارت
             Container(
                 height: 150,
                 child: cardShowRec()),
                SizedBox(height: 20,),

                //تصنبفات text
            Container(
              height: 30,
              child: Flexible(
                child:SizedBox(
                  height: 30,
                  child: ListView.builder(
                    itemCount: 5,
                     scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                        margin: EdgeInsets.symmetric(horizontal: 5),
                       width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white
                          ),
                        );
                      },
                  ),
                )
              ),
            ),


           Container(
             margin: EdgeInsets.only(top: 12),
               height:410,
               child: const cardShow()),

          ]
          ),
          
         //
         //  bottomNavigationBar: BottomNavigationBar(
         //    items: const <BottomNavigationBarItem>[
         //      BottomNavigationBarItem(
         //        icon: Icon(Icons.home),
         //        label: 'Home',
         //      ),
         //      BottomNavigationBarItem(
         //        icon: Icon(Icons.shopping_cart),
         //        label: 'Cart',
         //      ),
         //
         //      BottomNavigationBarItem(
         //        icon: Icon(Icons.favorite),
         //        label: 'Favorite',
         //      ),
         //      BottomNavigationBarItem(
         //        icon: Icon(Icons.person),
         //        label: 'Profile',
         //      ),
         //
         //    ],
         //    type: BottomNavigationBarType.shifting,
         // //   currentIndex: _selectedIndex,
         //   selectedItemColor: kPrimaryColor,
         // //   onTap: _onItemTapped,
         //    // unselectedFontSize: 0,
         //    unselectedItemColor: Colors.black12,
         //  )

    );
  }
}


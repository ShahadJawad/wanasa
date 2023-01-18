import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/widgets/cardShow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
   // var bucket;
    var h=MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
            body :  Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
                  children:[

                // الصوره والاسم
                 Padding(
                  padding:const EdgeInsets.only(top: 30),
                child: ListTile(
                  //title: CircleAvatar(backgroundColor: kPrimaryColor),
                  leading:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const[
                      Text('وقت الوناسة',style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                      Text('أكتشف البصره',style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  trailing: CircleAvatar(backgroundImage:AssetImage('assest/images/person.jpg') ,radius: 28),
                ),
                ),


                const SizedBox(height: 20,),

                Container(
                  height: 30,
                  child: Flexible(
                    child:SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: mycategorylist.length,
                         scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                            margin: EdgeInsets.symmetric(horizontal: 5,),
                            padding: EdgeInsets.symmetric(horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                              ),
                              child: Row(
                                children: [
                                  mycategorylist[index].icon,
                                  Text(' ${mycategorylist[index].name}'),
                                ],
                              ),
                            );
                          },
                      ),
                    )
                  ),
                ),


               Container(
                 color: Colors.grey[200],
                 margin: EdgeInsets.only(top: 12),
                 height: h/1.38,
                   child:  cardShow()),

              ]
              ),
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

      ),
    );
  }
}


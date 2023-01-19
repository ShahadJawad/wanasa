import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/test/test.dart';
import 'package:untitled/widgets/cardShow.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home>  with TickerProviderStateMixin {

  late TabController _tabController = TabController(length: 6, vsync: this);
  @override
  Widget build(BuildContext context) {
   // var bucket;
    var h=MediaQuery.of(context).size.height;
    return  SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                      Text('أكتشف مدينتك',style: TextStyle(fontSize: 13)),
                    ],
                  ),
                  trailing: CircleAvatar(backgroundImage:AssetImage('assest/images/person.jpg') ,radius: 28),
                ),
                ),

                Container(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TabBar(
                      labelPadding: EdgeInsets.only(left: 20,right: 10,top: 25),
                      padding: EdgeInsets.only(right: 10),
                      isScrollable: true,
                      controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,

                        tabs: const[
                          Text('الكل'),
                          Text('ترفيهيه'),
                          Text('فن و ثقافه'),
                          Text('متاحف'),
                          Text('دينيه'),
                          Text('مناسب للاطفال'),

                        ]),
                  ),
                ),

                Container(
                  height: h/1.51,
                  child: TabBarView(
                    controller: _tabController,
                      children: [

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                        Container(
                            color: Colors.white,
                            margin: EdgeInsets.only(top: 12),
                            child:  cardShow()),

                      ]
                  ),
                )

                //const SizedBox(height: 20,),

                // Container(
                //   height: 30,
                //   child: Flexible(
                //     child:SizedBox(
                //       height: 30,
                //       child: ListView.builder(
                //         itemCount: mycategorylist.length,
                //          scrollDirection: Axis.horizontal,
                //           itemBuilder: (context, index) {
                //             return Container(
                //             margin: EdgeInsets.symmetric(horizontal: 5,),
                //             padding: EdgeInsets.symmetric(horizontal: 5),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 color: Colors.white
                //               ),
                //               child: Row(
                //                 children: [
                //                   mycategorylist[index].icon,
                //                   Text(' ${mycategorylist[index].name}'),
                //                 ],
                //               ),
                //             );
                //           },
                //       ),
                //     )
                //   ),
                // ),

               //
               // Container(
               //   color: Colors.grey[200],
               //   margin: EdgeInsets.only(top: 12),
               //   height: h/1.38,
               //     child:  cardShow()),

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


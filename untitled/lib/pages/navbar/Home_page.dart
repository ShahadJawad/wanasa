import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:untitled/lists/list1.dart';
import 'package:untitled/pages/showAll/Recommended_pliecse.dart';
import 'package:untitled/pages/details/detailRecomPage.dart';
import 'package:untitled/pages/details/detailsPage.dart';
import 'package:untitled/pages/showAll/public_plieces.dart';

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
          body :  Padding(
               padding:const EdgeInsets.symmetric(horizontal: 0),
              
                child: Column(children:   <Widget>[

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
                    trailing:const CircleAvatar(backgroundColor: Colors.teal,radius: 20),
                  ),
                  ),

                  //البحث
                  Container(
                    margin:const EdgeInsets.only(top: 15,left: 20,right: 20),
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:Border.all(color: Colors.grey),

                      borderRadius: BorderRadius.circular(30)
                    ),
                    child:const TextField(
                      decoration: InputDecoration(
                        hintText: 'البحث عن أماكن',
                          border: InputBorder.none,
                      prefixIcon: Icon(Icons.search_outlined,),
                      ),
                    ),
                  ),

                  //اماكن شعبيه text
                  Container(

                    padding:const EdgeInsets.only(right: 8,top: 5,left: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         const Text('أماكن شعبيه',style: TextStyle(
                              fontSize: 18,
                            ),),
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context)=> PublicPage()));
                            },
                            child:Text( ' عرض الكل >>',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color:Colors.grey[500],)
                          ),)
                        ],),
                  ),

                  //اماكن شعبيه

                  Flexible(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                        itemCount:5 ,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsPublicPage()));
                              },
                              child: Container(
                                padding:const EdgeInsets.only(top: 6,right: 8,left: 6),
                                height: 80,width: 150,
                                margin:const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                  image: DecorationImage(image: AssetImage(imagelist[index].myimage),
                                      fit: BoxFit.fill)
                                ),
                                child: Column(
                                  children: [
                                    
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 0.5,top: 3),
                                          height: 28,width: 70,
                                          decoration: BoxDecoration(
                                            color: Colors.white24,
                                            borderRadius: BorderRadius.circular(10)
                                          ),
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                             const Text('25',style: TextStyle(color: Colors.white)),
                                             InkWell(
                                               onTap: () {},
                                                 child: Icon(Icons.favorite,color: Colors.white60,size: 24,)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    // اسم المكان
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 150),
                                          child: Container(
                                              decoration:const BoxDecoration(
                                              ),
                                              //padding: EdgeInsets.only(top: 150),
                                              child:const Text(' اسم المكان',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20
                                                ),)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )

                    ),
                  ),


                  //اماكن موصئ يها text
                  Container(
                    padding:const EdgeInsets.only(left: 5,right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('أماكن موصئ يها ',style: TextStyle(
                          fontSize: 18,
                        ),),
                        InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> RecommendedPage()));
                            },
                            child: Text(' عرض الكل >>',style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color:Colors.grey[500],)
                            ),
                        )
                      ],),
                  ),

                  Flexible(
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:5 ,
                        shrinkWrap: true,
                        itemBuilder: (context, index) =>
                            InkWell(
                              onTap: (){
                                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>detailsRecomPage()));
                              },
                              child: Container(
                                height: 80,width: 150,
                                margin:const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(image: AssetImage(imagelist2[index].myimage),
                                        fit: BoxFit.fill)),
                                child: Column(
                                  children: [

                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(right: 8,top: 8),
                                          height: 28,width: 70,
                                          decoration: BoxDecoration(
                                              color: Colors.white24,
                                              borderRadius: BorderRadius.circular(10)
                                          ),
                                          child:Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              const Text('25',style: TextStyle(color: Colors.white)),
                                              InkWell(
                                                  onTap: () {},
                                                  child: Icon(Icons.favorite,color: Colors.white60,size: 24,)),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),

                                    // اسم المكان
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 150),
                                          child: Container(
                                            decoration:const BoxDecoration(
                                              ),
                                              //padding: EdgeInsets.only(top: 150),
                                              child:const Text(' اسم المكان',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20
                                                ),)),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )

                    ),
                  ),
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

    );
  }
}


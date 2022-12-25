import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.search_outlined),
        title: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: 'بحث',
            hintStyle: TextStyle(
              color: Colors.grey[300],fontSize: 20
            )
          ),
        ),
        elevation: 0.0,
        backgroundColor: kPrimaryColor,
        automaticallyImplyLeading: false,
      ),
      // body: Container(
      //   margin:const EdgeInsets.only(top: 15,left: 20,right: 20),
      //   height: 50,
      //   decoration: BoxDecoration(
      //       color: Colors.white,
      //       border:Border.all(color: Colors.grey),
      //
      //       borderRadius: BorderRadius.circular(30)
      //   ),
      //   child:const TextField(
      //     decoration: InputDecoration(
      //       hintText: 'البحث عن أماكن',
      //       border: InputBorder.none,
      //       prefixIcon: Icon(Icons.search_outlined,),
      //     ),
      //   ),
      // ),

    );
  }
}

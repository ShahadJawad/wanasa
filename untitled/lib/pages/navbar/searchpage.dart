import 'package:flutter/material.dart';
import 'package:untitled/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled/pages/details/detailPage.dart';



class searchPage extends StatefulWidget {
  const searchPage({Key? key}) : super(key: key);

  @override
  State<searchPage> createState() => _searchPageState();
}

class _searchPageState extends State<searchPage> {

  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('places')
        .where('name_array', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          
          leading: Icon(Icons.search_outlined),
          title: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ' بحث ....',
              hintStyle: TextStyle(
                color: Colors.grey[300],fontSize: 20
              )
            ),

            onChanged: (query) {
              searchFromFirebase(query);
            },

          ),
          elevation: 0.0,
          backgroundColor: kPrimaryColor,
          automaticallyImplyLeading: false,
        ),


        body:  ListView.builder(
            itemCount: searchResult.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading:CircleAvatar(
                  backgroundImage:NetworkImage(searchResult[index]['img_path'],) ,
                ),
                title: Text(searchResult[index]['name']),
                subtitle:Text(searchResult[index]['city']) ,

                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => detailsPage(),));
                },

              );
            },
        ),









        // body: StreamBuilder<QuerySnapshot>(
        //   stream: (name != "" && name != null)
        //       ? FirebaseFirestore.instance
        //       .collection('name')
        //       .where("searchKeywords", arrayContains: name)
        //       .snapshots()
        //       : FirebaseFirestore.instance.collection("items").snapshots(),
        //   builder: (context, snapshot) {
        //     return (snapshot.connectionState == ConnectionState.waiting)
        //         ? Center(child: CircularProgressIndicator())
        //         : ListView.builder(
        //       itemCount: snapshot.data.documents.length,
        //       itemBuilder: (context, index) {
        //         DocumentSnapshot data = snapshot.data.documents[index];
        //         return Card(
        //           child: Row(
        //             children: <Widget>[
        //               Image.network(
        //                 data['imageUrl'],
        //                 width: 150,
        //                 height: 100,
        //                 fit: BoxFit.fill,
        //               ),
        //               SizedBox(
        //                 width: 25,
        //               ),
        //               Text(
        //                 data['name'],
        //                 style: TextStyle(
        //                   fontWeight: FontWeight.w700,
        //                   fontSize: 20,
        //                 ),
        //               ),
        //             ],
        //           ),
        //         );
        //       },
        //     );
        //   },
        // ),



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

      ),
    );
  }
}

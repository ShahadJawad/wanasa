import 'package:flutter/material.dart';
import '../db/mydb.dart';

class test extends StatelessWidget {

  SqlDb sqLDb = SqlDb();

  Future<List<Map>> readData() async{
    var response = await sqLDb.readData("SELECT * FROM places");
    return response ;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: Container(
         child: ListView(
           children: [
             FutureBuilder(
             future: readData(),
             builder: (BuildContext context ,AsyncSnapshot<List<Map>> snapshot) {

               if (snapshot.hasData){
                 return ListView.builder(
                   itemCount: snapshot.data!.length,
                   physics: NeverScrollableScrollPhysics(),
                   shrinkWrap: true,
                   itemBuilder: (context, i) {
                            return Column(
                              children: [
                                Text("${snapshot.data![i]['placeName']}"),
                                Text("${snapshot.data![i]['placeType']}"),
                                Text("${snapshot.data![i]['placeDescription']}"),
                              ],
                            );


                 },);
                 }
               return Center(child: CircularProgressIndicator());
             })
           ],
         ),
       ),
    );
  }
}

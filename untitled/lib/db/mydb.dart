  import 'package:sqflite/sqflite.dart';
  import 'package:path/path.dart';

  class SqlDb {

    static final table1 = 'places';
    static Database? _db;

    Future<Database?> get db async {
      if (_db == null) {
        _db = await intialDb();
        return _db;
      } else {
        return _db;
      }
    }


    intialDb() async {
      String databasepath = await getDatabasesPath();
      String path = join(databasepath, 'shahad.db');
      Database mydb = await openDatabase(
          path, onCreate: _onCreate, version: 5, onUpgrade: _onUpgrade);
      return mydb;
    }

    _onUpgrade(Database db, int oldversion, int newversion) {
      print("onUpgrade =====================================");
    }


    _onCreate(Database db , int version) async {
      await db.execute('''
  CREATE TABLE $table1 (
    "id" INTEGER  NOT NULL PRIMARY KEY  AUTOINCREMENT, 
    "placeName" TEXT NOT NULL,
    "placeType" TEXT 
  )
  ''');



    // prepopulate a few rows (consider using a transaction)
    await db.rawInsert('INSERT INTO $table1  ("placeName" , "placeType" ) VALUES("شط العرب", "صيفي")');
    await db.rawInsert('INSERT INTO $table1  ("placeName","placeType") VALUES("التنومه", "شتائي")');
    await db.rawInsert('INSERT INTO $table1  ("placeName", "placeType") VALUES("الكوىنيش", "شتائي")');

      print(" onCreate =====================================");
    }

    readData(String sql) async {
      Database? mydb = await db;
      List<Map> response = await mydb!.rawQuery(sql);
      return response;
    }

    insertData(String sql) async {
      Database? mydb = await db;
      int response = await mydb!.rawInsert(sql);
      return response;
    }

    updateData(String sql) async {
      Database? mydb = await db;
      int response = await mydb!.rawUpdate(sql);
      return response;
    }

    deleteData(String sql) async {
      Database? mydb = await db;
      int response = await mydb!.rawDelete(sql);
      return response;
    }
  }







// import 'package:path/path.dart';
//
// class sqlDb{
//
//   static Database? _db;
//
//   Future<Database?> get db async{
//     if (_db == null){
//       _db = await intialDb();
//       return _db;
//     } else {
//       return _db;
//     }
//   }
//
//   intialDb() async{
//     String dbPath = await getDatabasesPath();
//     String path = join(dbPath , 'shahad.db');
//     Database mydb = await openDatabase(path,onCreate: _onCreate , version: 2 , onUpgrade: _onUpgrade);
//     return mydb;
//   }
//   _onUpgrade(Database db , int oldversion , int newversion){
//     print('onUpgrade---------------');
//
//   }
//
//
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE "places" (
//            "Id" INTEGER PRIMARY KEY,
//            "placeName" TEXT NOT NULL,
//            "placeImg" TEXT ,
//            "placeType" TEXT ,
//            "placeDescription" TEXT ,
//            "placeLocation" TEXT ,
//           )
//           ''');
//
//     // prepopulate a few rows (consider using a transaction)
//     await db.rawInsert('INSERT INTO "places" ( "placeName" , "placeType" ) VALUES("شط العرب", "صيفي")');
//     await db.rawInsert('INSERT INTO "places" (placeName","placeType") VALUES("التنومه", "شتائي")');
//     await db.rawInsert('INSERT INTO "places" (placeName", "placeType") VALUES("الكوىنيش", "شتائي")');
//
//
//
//     await db.execute('''
//       CREATE TABLE "favorite" (
//       "id" INTEGER  NOT NULL PRIMARY KEY AUTOINCREMENT,
//       )
//    ''' );
//
//     print('Create data base DOWN -------');
//   }
//
//
//   readData(String sql) async {
//     Database? mydb = await db;
//     var response = await mydb!.rawQuery(sql);
//     return response;
//   }
//
//   insertData(String sql) async {
//     Database? mydb = await db;
//     var response = await mydb!.rawInsert(sql);
//     return response;
//   }
//
//   updateData(String sql) async {
//     Database? mydb = await db;
//     var response = await mydb!.rawUpdate(sql);
//     return response;
//   }
//
// }


import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBProvider{
  Database? db;

  DBProvider(){
    init();
  }
   void init() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, "Cats4.db");
    db = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      await db.execute("CREATE TABLE Cats ("
          "id INTEGER PRIMARY KEY,"
          "name TEXT,"
          "age INTEGER,"
          "image TEXT"
          ")");
    });
   }
}
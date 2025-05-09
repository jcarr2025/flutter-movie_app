import 'package:s15v189movie_app/model/Cast.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBProvider {
  Database? db;

  DBProvider() {
    init();
  }

  void init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentsDirectory.path, "Cats4.db");
    db = await openDatabase(
        path, version: 1, onCreate: (Database newDb, int version) async {
      await newDb.execute("""
          CREATE TABLE Cats (
          id INTEGER PRIMARY KEY,
          name TEXT,
          profile_path TEXT,
          media_id INTEGER
          )
      """);
    });
  }

   Future<List<Cast>?>  fecthCats(int mediaId) async {
    var maps = await db?.query("Cast",
        columns: null,
        where: "movie_id = ?",
        whereArgs: [mediaId]);
    if (maps != null) {
       return maps.map<Cast>((item) => new Cast.fromDB(item)).toList();
    }
    return null;
  }
  void AddCast(Cast cast) {
      db?.insert(
          "Cast",
          cast.toMap(),
          conflictAlgorithm: ConflictAlgorithm.fail);
  }
}
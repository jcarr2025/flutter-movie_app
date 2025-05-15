import 'package:s15v189movie_app/common/MediaProvider.dart';
import 'package:s15v189movie_app/model/Cast.dart';
import 'package:s15v189movie_app/resources/resource_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io';

class DBProvider   implements ResourceProvider {
  static final DBProvider _dbProvider = DBProvider();
  Database? db;

  DBProvider() {
    init();
  }

  static DBProvider get(){
    return _dbProvider;
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

   Future<List<Cast>?>  fetchCasts(int mediaId, MediaType mediaType) async {
    print('${mediaId.toString()}Lectuera de base de datos local '  );
    var maps = await db?.query("Casts",
        columns: null,
        where: "media_Id = ?",
        whereArgs: [mediaId]);
    if (maps != null) {
       return maps.map<Cast>((item) => new Cast.fromDB(item)).toList();
    }
    return null;
  }
  void AddCast(Cast cast) {
    print('${cast.mediaId.toString()}Insertar base de datos local '  );
      db?.insert(
          "Cast",
          cast.toMap(),
          conflictAlgorithm: ConflictAlgorithm.fail);
  }




}
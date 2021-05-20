import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import 'favModel.dart';

class DBHelper {
  static Database _db;
  static const String _databasename = 'fav.db';
  static const String table = 'recipies';
  static const columnID = 'id';
  static const String carbR = 'carb';
  static const String decR = 'dec';
  static const String titleR = 'title';
  static const String imgUrlR = 'imgUrl';
  static const String ingrR = 'ingr';
  static const String kcalR = 'kcal';
  static const String methodR = 'method';
  static const String proteinR = 'protein';

  // static const String ID = 'id';
  // static const String NAME = 'name';
  // static const String TABLE = 'Employee';
  // static const String DB_NAME = 'employee1.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  initDb() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databasename);
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE $table ($columnID INTEGER PRIMARY KEY,
        $titleR TEXT,
        $carbR TEXT,
        $decR TEXT,
        $imgUrlR TEXT,
        $ingrR TEXT, 
        $kcalR TEXT,
        $methodR TEXT,
         $proteinR TEXT)''');
  }

  Future<FavRecipies> save(FavRecipies employee) async {
    var dbClient = await db;
    employee.id = await dbClient.insert(table, employee.toMap());
    return employee;
    /*
    await dbClient.transaction((txn) async {
      var query = "INSERT INTO $TABLE ($NAME) VALUES ('" + employee.name + "')";
      return await txn.rawInsert(query);
    });
    */
  }

  Future<List<FavRecipies>> getEmployees() async {
    var dbClient = await db;
    List<Map> maps = await dbClient.query(table, columns: [
      columnID,
      titleR,
      decR,
      imgUrlR,
      ingrR,
      methodR,
      kcalR,
      proteinR,
      carbR
    ]);
    // List<Map> maps = await dbClient.rawQuery("SELECT * FROM $TABLE");
    List<FavRecipies> employees = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        employees.add(FavRecipies.fromMap(maps[i]));
      }
    }
    return employees;
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient
        .delete(table, where: '$columnID = ?', whereArgs: [id]);
  }

  // Future<int> update(FavRecipies employee) async {
  //   var dbClient = await db;
  //   return await dbClient.update(table, employee.toMap(),
  //       where: '$columnID = ?', whereArgs: [employee.id]);
  // }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}

import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Databasehelper {
static final _databasename = 'person.db';
static final _databaseversion = 1;
static final table = 'my_table';
static final columnID = 'id';
static final  titleR = 'title';
static final  carbR= 'carb';
static final  decR= 'dec';
static final  imgUrlR= 'imgUrl';
static final  ingrR= 'ingr';
static final  kcalR= 'kcal';
static final  methodR= 'method';
static final  proteinR='protein';

static Database _database;

Databasehelper._privateConstructor();
static final Databasehelper instance = Databasehelper._privateConstructor();

Future<Database> get database async{


  if(_database != null)
  return _database;

  _database = await _initDatabase();
  return _database;
}
 _initDatabase ()async{
  Directory documentdirecoty = await getApplicationDocumentsDirectory();
  String path = join(documentdirecoty.path,_databasename);
  return await openDatabase(path,version: _databaseversion,onCreate:_onCreate);
}

Future _onCreate(Database db, int version)async{
  await db.execute(
'''
    CREATE TABLE $table (
$columnID INTEGER PRIMARY KEY,
$titleR TEXT ,
$decR TEXT ,
$ingrR TEXT ,
$methodR TEXT ,
$carbR TEXT ,
$kcalR TEXT,
$proteinR TEXT,
$imgUrlR BLOB ,
     )
'''
  );
}
Future<int> insert(Map<String,dynamic> row) async{
  Database db = await instance.database;
  return await db.insert(table, row);
}

Future<List<Map<String, dynamic>>> queryall() async{

Database db = await instance.database;
return await db.query(table);
}
Future<List<Map<String , dynamic>>> queryspacific(int age)async{
Database db = await instance.database;
var res = await db.rawQuery('SELECT * FROM my_table WEHER age>?',[age]);
return res;
}
Future<int> deletdata(int id) async{

  Database db = await instance.database;
  var res = await db.delete(table,where: "id = ?",whereArgs:[id]);
  return res;
}
Future<int> update(int id) async{
  Database db = await instance.database;
  var res = await db.update(table, {"name":"Desi Programer","age":2}, where: "id = ?", whereArgs: [id]);
  return res;
}
}
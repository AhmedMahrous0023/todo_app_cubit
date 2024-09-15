import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDataSqlHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialSql();
      return _db;
    }
    return _db;
  }

  Future<Database> initialSql() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'todo.db');
    Database mydb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "Categories"(
"id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
"name" TEXT NOT NULL,
"description" TEXT NOT NULL
)
''');
    print('CREATE successfuly database*************************');
  }

  Future<void> _onUpgrade(Database db,int oldVersion, int newVersion) async {
         print('SUCCESFULY UPGRADE555555555555555555555555555555555');
  }

  //read data from sql
  Future<List>readData(String sql)async{
    Database?mydb=await db ;
    List<Map>response =await mydb!.rawQuery(sql);
    return response ;
  }

  //insert data into sql

  Future<int>insertData(String sql)async{
    Database?mydb=await db;
    int response =await mydb!.rawInsert(sql);
    return response ;
  }

  //update data into sql

  Future<int>updateData(String sql)async{
    Database?mydb= await db;
    int response =await mydb!.rawUpdate(sql);
    return response ;
  }

  //delete data from sql

  Future<int>deleteData(String sql)async{
    Database?mydb=await db;
    int response =await mydb!.rawDelete(sql);
    return response ;
  }

  // delete all database
  Future<void>removeAllDataBase()async{
      String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'todo.db');
    await deleteDatabase(path);
  }
}

import 'package:shopsy_app/model/product.dart';

import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _obj = DBHelper._();

  DBHelper._();

  final dbname = "product.db";
  String tableName = "proTable";

  factory DBHelper() {
    return _obj;
  }

  static DBHelper get instance => _obj;
  Database? database;

  Future<void> initDatabase() async {
    database =
        await openDatabase(dbname, version: 2, onCreate: (db, version) async {
      await db.execute(
          '''CREATE TABLE "$tableName" ( "name" TEXT NOT NULL, "description" TEXT NOT NULL, "image" TEXT NOT NULL, "price" TEXT NOT NULL, "id" INTEGER NOT NULL UNIQUE, "datetime" TEXT, PRIMARY KEY("id" AUTOINCREMENT) );

    ''');
    }, singleInstance: true);
  }

  Future<void> insertProduct(Product product) async {
    database = await openDatabase(dbname);
    if (database == null) await initDatabase();
    database!.insert(tableName, product.toJson());
    database!.close();
  }

  Future deleteProduct(Product product) async {
    if (database == null) await initDatabase();
    database?.delete(tableName, where: "name=?", whereArgs: [product.name]);
  }

  Future<List<Map<String, Object?>>?> getProduct() async {
    var database = await openDatabase(dbname);
    return await database.rawQuery("select * from  $tableName");
  }
}

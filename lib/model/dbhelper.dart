import 'package:shopsy_app/model/database/product_model.dart';

import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper _obj = DBHelper._();

  DBHelper._();

  final dbname = "shopsy.db";
  String tableName = "Product";

  factory DBHelper() {
    return _obj;
  }

  static DBHelper get instance => _obj;
  Database? database;

  Future<void> initDatabase() async {
    database = await openDatabase(dbname, version: 3, onCreate: (db, version) {
      db.execute('''CREATE TABLE "$tableName" (
	"name"	TEXT NOT NULL,
	"description"	TEXT NOT NULL,
	"image"	TEXT NOT NULL,
	"price"	TEXT NOT NULL,
	"id"	INTEGER NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);''');
    }, singleInstance: true);
  }

  Future<void> insertProduct(
      String name, String description, String image, String price) async {
    var database = await openDatabase(dbname);
    List<Map<String, dynamic>> result = await database.query(
      tableName,
      where: 'name = ? AND description = ? AND image = ? AND price = ?',
      whereArgs: [name, description, image, price],
    );
    database.insert(tableName, {
      "name": name,
      "description": description,
      "image": image,
      "price": price,
      "id":0,
    });
    database.close();
    // Product product = Product();
    // List<Map<String, dynamic>> data = await database.query(tableName,
    //     where: "name = ? AND description = ? AND image = ? AND price = ?",
    //     whereArgs: [
    //       product.name,
    //       product.description,
    //       product.image,
    //       product.price
    //     ]);
    // if (data.isEmpty) {
    //   database.insert(tableName, {
    //     "name": product.name,
    //     "description": product.description,
    //     "image": product.image,
    //     "price": product.price
    //   });
    // }
    // database.close();
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

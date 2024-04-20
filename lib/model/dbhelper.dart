import 'package:shopsy_app/model/database/product_model.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static final DBHelper instance = DBHelper._();

  DBHelper._();

  final dbname = "shopsy.db";
  String tableName = "Product";

  factory DBHelper() {
    return instance;
  }

  Database? database;

  Future initDatabase() async {
    database = await openDatabase(dbname, version: 1, onCreate: (db, version) {
      db.execute('''CREATE TABLE "$tableName" (
	"name"	TEXT NOT NULL,
	"price"	BLOB NOT NULL,
	"id"	INTEGER NOT NULL UNIQUE,
	"discripiton"	TEXT NOT NULL,
	"image"	TEXT NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
)
)''');
    }, singleInstance: true);
  }

  Future insertProduct(Map<String, dynamic> product) async {
    database = await openDatabase(dbname);
    database?.insert(tableName, product,
        conflictAlgorithm: ConflictAlgorithm.replace);
    database?.close();
  }

  Future deleteProduct(Product product) async {
    if (database == null) await initDatabase();
    database?.delete(tableName, where: "id=?");
  }

  Future<List<Map<String, Object?>>?> getProduct() async {
    database = await openDatabase(dbname);
    return await database
        ?.rawQuery("select * from  Product where name=${Product().name}");
  }
}

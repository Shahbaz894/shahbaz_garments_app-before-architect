
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../data/model/product_model.dart';

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db; // Return the _db instance.
  }

  // get database => _db;

  Future<Database> initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'cart.db');
    //print("Database path: $path");
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    // print(db);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE cart (
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        image TEXT,
        description TEXT,
        initialPrice INTEGER,
        quantity INTEGER,
        rating TEXT
      )
    ''');
  }

  Future<ProductModel> insert(ProductModel cart) async {
    var dbClient = await db;
    await dbClient!.insert('cart', cart.toJson());
    return cart;
  }

  Future<List<ProductModel>> getCartList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('cart');
    return queryResult.map((e) => ProductModel.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('cart', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(ProductModel cart) async {
    var dbClient = await db;
    return await dbClient!.update('cart', cart.toJson(),
        where: 'id = ?', whereArgs: [cart.id]);
  }





}

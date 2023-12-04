import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../data/model/favorite_model.dart';
import '../data/model/product_model.dart';

class DBHelperFav {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db; // Return the _db instance.
  }

  Future<Database> initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'favorites.db');
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE favorites (
        id INTEGER PRIMARY KEY,
        title TEXT,
        price REAL,
        image TEXT
      )
    ''');
  }

  Future<FavoriteProductModel> insert(FavoriteProductModel fav) async {
    var dbClient = await db;
    await dbClient!.insert('favorites', fav.toJson());
    return fav;
  }

  Future<List<FavoriteProductModel>> getFavoritesList() async {
    var dbClient = await db;
    final List<Map<String, dynamic>> queryResult = await dbClient!.query('favorites');
    return queryResult.map((e) => FavoriteProductModel.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(FavoriteProductModel fav) async {
    var dbClient = await db;
    return await dbClient!.update('favorites', fav.toJson(),
        where: 'id = ?', whereArgs: [fav.id]);
  }
}

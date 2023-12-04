
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../data/model/product_model.dart';
import '../data/model/profile_model.dart';

class DBProfile {
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
    String path = join(documentDirectory.path, 'profile.db');
    //print("Database path: $path");
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    // print(db);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE profile (
        id INTEGER PRIMARY KEY,
        title TEXT,
        
       
        MobileNo INTEGER,
        
      )
    ''');
  }

  Future<ProfileModel> insert(ProfileModel profile) async {
    var dbClient = await db;
    await dbClient!.insert('profile', profile.toJson());
    return profile;
  }

  Future<List<ProfileModel>> getProfileList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('profile');
    return queryResult.map((e) => ProfileModel.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {
    var dbClient = await db;
    return await dbClient!.delete('profile', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateQuantity(ProfileModel profile) async {
    var dbClient = await db;
    return await dbClient!.update('profile', profile.toJson(),
        where: 'id = ?', whereArgs: [profile.id]);
  }





}


import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:io' as io;

import '../data/model/shipping_address_model.dart';

class DBHelperShipping {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDatabase();
    return _db; // Return the _db instance.
  }

  get database => _db;

  Future<Database> initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'shipping_addresses.db');
    print("Database path: $path");
    var db = await openDatabase(path, version: 2, onCreate: _onCreate);
    print(db);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
       CREATE TABLE shipping_addresses(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        address TEXT,
        order_number TEXT,
        mobile VARCHAR
      )
    ''');
  }

  Future<ShippingAddress> insert(ShippingAddress shippingAddress) async {
    var dbClient = await db;
    await dbClient!.insert('shipping_addresses', shippingAddress.toJson());
    return shippingAddress;
  }

  Future<List<ShippingAddress>> getShippingAddressList() async {
    var dbClient = await db;
    final List<Map<String, Object?>> queryResult =
    await dbClient!.query('shipping_addresses');
    return queryResult.map((e) => ShippingAddress.fromJson(e)).toList();
  }

  Future<int> delete(int id) async {

    var dbClient = await db;
    return await dbClient!.delete('shipping_addresses', where: 'id = ?', whereArgs: [id]);
  }

  Future<int> updateAddress(ShippingAddress shipping_addresses) async {
    var dbClient = await db;
    return await dbClient!.update('shipping_addresses', shipping_addresses.toJson(),
        where: 'id = ?', whereArgs: [shipping_addresses.id]);
  }

// Future<List<ShippingAddress>> getAllAddresses() async {
//   final db = await database;
//   final List<Map<String, dynamic>> maps = await db.query('shipping_addresses');
//   return List.generate(maps.length, (i) {
//     return ShippingAddress.fromJson(maps[i]);
//   });
// }

}

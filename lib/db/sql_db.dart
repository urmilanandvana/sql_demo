import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_demo/component/fun_cmp.dart';
import 'package:sql_demo/model/product_model.dart';

class SQLDatabase {
  static final SQLDatabase instance = SQLDatabase._instance();
  static Database? _database;

  static String tableName = 'product';

  SQLDatabase._instance();

  // Future<Database> get db async {
  //   _database ??= await initDb();
  //   return _database!;
  // }

  initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'shoes.db');
    final dbExists = await File(path).exists();

    if (!dbExists) {
      // If not, copy it from the assets.
      ByteData data = await rootBundle.load("assets/shoes.db");
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write the database to the documents directory.
      await File(path).writeAsBytes(bytes);
    }

    print("--------------->path--->${path}");
    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        // db.execute('''
        // CREATE TABLE IF NOT EXISTS $tableName (
        //   id INTEGER PRIMARY KEY AUTOINCREMENT,
        //   name TEXT NOT NULL,
        //   image BLOB NOT NULL,
        //   price TEXT,
        //   rating TEXT,
        //   likeStatus TEXT,
        //   created_at TEXT NOT NULL,
        //   updated_at TEXT NOT NULL
        // )''');
      },
    );
  }

  Future<List<ProductModel>> getDbData() async {
    var list = [];
    final String query = 'SELECT * FROM $tableName'; // Fetch specific columns

    list = await _database!.rawQuery(query).catchError((e) {
      print("------------------------->e ---------->${e}");
    });

    print("-----------list----------->${list.length}");
    return List.generate(list.length, (i) {
      return ProductModel.fromJson(list[i]);
    });
  }

  updateData({
    required ProductModel productModel,
  }) async {
    String query = "UPDATE $tableName SET quantity = ? WHERE id = ?";
    var result = await _database!.rawUpdate(
        query, [productModel.quantity, productModel.id]).catchError((e) {
      print("------------------------->e ---------->${e}");
    });
  }
}

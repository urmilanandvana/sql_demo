import 'dart:io';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sql_demo/component/fun_cmp.dart';

class SQLDatabase {
  static final SQLDatabase instance = SQLDatabase._instance();
  static Database? _database;

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
        db.execute('''
      CREATE TABLE IF NOT EXISTS product (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT NOT NULL,
        image BLOB NOT NULL,
        price TEXT,
        rating TEXT,
        likeStatus TEXT,
        created_at TEXT NOT NULL, 
        updated_at TEXT NOT NULL 
      )''');
      },
    );
  }

  insertData() async {}
}
// SQLDatabase sqlDatabase = SQLDatabase();

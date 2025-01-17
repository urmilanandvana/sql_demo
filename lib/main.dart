import 'package:flutter/material.dart';
import 'package:sql_demo/db/sql_db.dart';
import 'package:sql_demo/screen/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLDatabase.instance.initDb();
  runApp(const MyApp());
}

// /data/user/0/com.example.sql_demo/databases/shoes.db
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

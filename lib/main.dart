import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sql_demo/db/sql_db.dart';
import 'package:sql_demo/screen/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SQLDatabase.instance.initDb();
  runApp(const MyApp());
}

// /data/user/0/com.shoes/databases/shoes.db
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(fontFamily: 'neometric'),
      home: SplashScreen(),
    );
  }
}

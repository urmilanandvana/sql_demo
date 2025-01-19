import 'package:flutter/material.dart';
import 'package:sql_demo/component/fun_cmp.dart';
import 'package:sql_demo/db/sql_db.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () async {
              await SQLDatabase.instance.insertData();
            },
            child: Text("Tap")),
      ),
    );
  }
}

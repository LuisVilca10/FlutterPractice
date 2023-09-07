import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Pages/login_page.dart';
import 'package:hive_flutter/adapters.dart';

//const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() async {
  await Hive.initFlutter();
  await Hive.openBox('hiveStore');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}

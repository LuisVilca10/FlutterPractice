import 'package:flutter/material.dart';
import 'package:flutter_application_1/UI/Pages/pagina1.dart';
import 'package:flutter_application_1/UI/Pages/pagina2.dart';

const Color darkBlue = Color.fromARGB(255, 18, 32, 47);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'primerapag': (context)=>Formulariopag(),
        'segundapa' : (context)=>const SegundaPagina()
      },
      home: Scaffold(
        appBar: AppBar(
          title: Text("Formulario"),
        ),
        body: Center(
          child: Formulariopag(),
        ),
      ),
    );
  }
}

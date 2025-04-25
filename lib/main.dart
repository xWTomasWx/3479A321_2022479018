import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working!");
    
    return MaterialApp(
      title: 'Laboratorio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
        fontFamily: 'Pokemon'
      ),
      home: const MyHomePage(title: 'Laboratorio Demo Home Page'),
    );
  }
}

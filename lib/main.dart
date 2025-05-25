import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/home.dart';
import 'package:application_laboratorio/provider/app_data.dart';
import 'package:provider/provider.dart';
import 'package:application_laboratorio/services/database_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DatabaseHelper().initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //var logger = Logger();
    //logger.d("Logger is working!");

    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(), // Provide the state object
      child: MaterialApp(
        title: 'My App',
        theme: ThemeData(primarySwatch: Colors.green, fontFamily: 'Comic'),
        home: MyHomePage(title: 'Laboratorio'),
      ),
    );
  }
}

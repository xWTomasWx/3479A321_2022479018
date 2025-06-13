import 'package:flutter/material.dart';
//import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/home.dart';
import 'package:application_laboratorio/data/services/app_data.dart';
import 'package:provider/provider.dart';
import 'package:application_laboratorio/data/services/database_helper.dart';
import 'package:application_laboratorio/theme/theme.dart';
import 'package:application_laboratorio/theme/util.dart';

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
    final brightness = View.of(context).platformDispatcher.platformBrightness;
    TextTheme textTheme = createTextTheme(context, "Lexend Deca", "Limelight");

    MaterialTheme theme = MaterialTheme(textTheme);
    return ChangeNotifierProvider<AppData>(
      create: (context) => AppData(), // Provide the state object
      child: MaterialApp(
        title: 'My App',
        theme: brightness == Brightness.light ? theme.light() : theme.dark(),
        home: MyHomePage(title: 'Laboratorio'),
      ),
    );
  }
}

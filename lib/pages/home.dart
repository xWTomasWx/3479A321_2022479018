import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    logger.d("Logger is working!");
    String assetName = "assets/icons/check.svg";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      persistentFooterButtons: botonesAbajo,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SvgPicture.asset(
              assetName,
              semanticsLabel: 'Icono',
            ),
            const Text('Has presionado el boton esta cantidad de veces:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> get botonesAbajo {
    return [
      TextButton(onPressed: _incrementCounter, child: Icon(Icons.exposure_plus_1)),
      TextButton(onPressed: _decrementCounter, child: Icon(Icons.exposure_minus_1)),
      TextButton(onPressed: _resetCounter, child: Icon(Icons.settings_backup_restore_rounded))
    ];
  }
}
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:logger/logger.dart';
import 'package:application_laboratorio/pages/list_content.dart';
import 'package:application_laboratorio/pages/about.dart';


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

  void _navigateCounter(){
    if(_counter % 2 == 0){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListContent()),
      );
    }else{
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    }
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
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const ListContent()),
                );
              }, 
              child: const Text('Lista'),
            ),
            SizedBox(),  
          ],
        ),
      ],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Card(
            elevation: 8,
            color: Colors.greenAccent,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    const Text('Flutter es un framework de código abierto creado por Google, utilizado para desarrollar aplicaciones multiplataforma (móviles, web, de escritorio e integradas) desde una única base de código. Este framework es conocido por su facilidad de desarrollo, rendimiento y capacidad de crear interfaces de usuario personalizadas y atractivas.'),
                    SvgPicture.asset(
                      assetName,
                      semanticsLabel: 'Icono',
                    ),
                    const Text('Has presionado el boton esta cantidad de veces:'),
                    Text(
                      '$_counter',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: _incrementCounter,
                          child: Icon(Icons.exposure_plus_1),
                        ),
                        ElevatedButton(
                          onPressed: _decrementCounter,
                          child: Icon(Icons.exposure_minus_1),
                        ),
                        ElevatedButton(
                          onPressed: _resetCounter,
                          child: Icon(Icons.settings_backup_restore_rounded),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: _navigateCounter, 
                      child: const Text('Ir'),
                    ),
                  ],
                  
                ),
              ),
              /*child: Column(
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
                
              ),*/
              
            
            
          ),
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
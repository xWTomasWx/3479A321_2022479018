import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:application_laboratorio/pages/list_content.dart';
import 'package:application_laboratorio/pages/about.dart';
import 'package:application_laboratorio/provider/app_data.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() {
    print("Create state");
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  //int _counter = 0;
  _MyHomePageState() {
    print("Constructor, Mounted: $mounted");
  }

  @override
  void initState() {
    super.initState();
    print("initState(), Mounted: $mounted");
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies(), Mounted: $mounted");
  }

  @override
  void setState(VoidCallback fn) {
    print("setState()");
    super.setState(fn);
  }

  @override
  void didUpdateWidget(covariant MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget(), Mounted: $mounted");
  }

  @override
  void deactivate() {
    print("deactivate(), Mounted: $mounted");
    super.deactivate();
  }

  @override
  void dispose() {
    print("dispose(), Mounted: $mounted");
    super.dispose();
  }

  @override
  void reassemble() {
    print("reassemble(), Mounted: $mounted");
    super.reassemble();
  }

  /*void _incrementCounter() {
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
  }*/

  void _navigateCounter() {
    if (context.read<AppData>().counter % 2 == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ListContent()),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const About()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("build");
    //var logger = Logger();
    //logger.d("Logger is working!");
    String assetName = "assets/icons/check.svg";

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent[400],
        title: Text(widget.title),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
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
                  Text(
                    'Usuario: ${context.watch<AppData>().username}',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Flutter es un framework de código abierto creado por Google, utilizado para desarrollar aplicaciones multiplataforma (móviles, web, de escritorio e integradas) desde una única base de código. Este framework es conocido por su facilidad de desarrollo, rendimiento y capacidad de crear interfaces de usuario personalizadas y atractivas.',
                  ),
                  SvgPicture.asset(assetName, semanticsLabel: 'Icono'),
                  const Text('Has presionado el boton esta cantidad de veces:'),
                  Text(
                    '${context.watch<AppData>().counter}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: context.read<AppData>().incrementCounter,
                        child: Icon(Icons.exposure_plus_1),
                      ),
                      ElevatedButton(
                        onPressed: context.read<AppData>().decrementCounter,
                        child: Icon(Icons.exposure_minus_1),
                      ),
                      if (context.watch<AppData>().enableReset)
                        ElevatedButton(
                          onPressed: context.read<AppData>().resetCounter,
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
}

import 'package:flutter/material.dart';
import 'package:application_laboratorio/provider/app_data.dart';
import 'package:provider/provider.dart';

class About extends StatelessWidget {
  const About({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sobre')),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Volver'),
            ),
          ],
        ),
      ],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              child: TextFormField(
                initialValue: context.watch<AppData>().username,
                onChanged:
                    (value) => context.read<AppData>().setUsername(value),
                decoration: const InputDecoration(
                  icon: Icon(Icons.person),
                  border: UnderlineInputBorder(),
                  labelText: 'Ingresa tu nombre de usuario',
                ),
              ),
            ),
            SwitchListTile(
              title: const Text('Permitir reinicio'),
              value: context.watch<AppData>().enableReset,
              onChanged: (val) => context.read<AppData>().setResetEnabled(val),
            ),
            Text(
              'Sobre\nContador: ${context.watch<AppData>().counter}',
              style: TextStyle(fontSize: 30),
            ),
          ],
        ),
      ),
    );
  }
}

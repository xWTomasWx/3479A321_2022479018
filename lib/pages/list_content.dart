import 'package:application_laboratorio/pages/about.dart';
import 'package:flutter/material.dart';

class ListContent extends StatelessWidget{
  const ListContent({super.key});

  final List<String> elementos = const [
    'Hola',
    'Como',
    'Estas',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista'),
      ),
      persistentFooterButtons: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[    
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text('Volver')
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => About())
                );
              },
              child: const Text('Sobre')
            ),
          ],
        )
      ],
      body: ListView.builder(
        itemCount: elementos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(
              elementos[index],
              textAlign: TextAlign.center,
            ),
          );
        }
      ),
    );
  }
}
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  List<File> _images = [];

  @override
  void initState() {
    super.initState();
    _loadImages();
  }

  Future<void> _loadImages() async {
    final directory = await getApplicationDocumentsDirectory();
    final files =
        Directory(directory.path)
            .listSync()
            .where(
              (item) =>
                  item is File && item.path.toLowerCase().endsWith('.jpg'),
            )
            .toList();

    setState(() {
      _images =
          files.cast<File>().toList().reversed.toList(); // últimas primero
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Galería")),
      body: GridView.builder(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 4,
          mainAxisSpacing: 4,
        ),
        itemCount: _images.length,
        itemBuilder: (context, index) {
          return Image.file(_images[index], fit: BoxFit.cover);
        },
      ),
    );
  }
}

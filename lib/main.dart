import 'dart:io';

import 'package:camera_and_map/fetcfh_google_map.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MapSample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File? img;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: img == null
            ? const SizedBox()
            : Image(image: FileImage(File(img!.path))),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () async {
              openGallary();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.image),
          ),
          FloatingActionButton(
            onPressed: () async {
              openCamera();
            },
            tooltip: 'Increment',
            child: const Icon(Icons.camera_alt_rounded),
          ),
        ],
      ),
    );
  }

  void openGallary() async {
    var fileImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      img = File(fileImage!.path);
    });
  }

  void openCamera() async {
    var fileImage = await ImagePicker().pickImage(source: ImageSource.camera);
    setState(() {
      img = File(fileImage!.path);
    });
  }
}

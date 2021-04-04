import 'package:flutter_app/screens/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fridge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Frais',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Rubik',
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes:<String,WidgetBuilder>{
        '/': (BuildContext context) => CameraScreen(),
        '/details': (BuildContext context) => DetailScreen(),
        '/fridge': (BuildContext context) => FridgeScreen(),
      }
    );
  }
}
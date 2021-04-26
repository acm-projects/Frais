import 'package:flutter_app/screens/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/fridge.dart';
import 'package:flutter_app/banana.dart';
import 'package:flutter_app/orange.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

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
      home: CameraScreen(),
      initialRoute: '/',
      routes: {
        '/second': (BuildContext context) => FridgeScreen(),
        '/first': (BuildContext context) => CameraScreen(),
        '/bananas' : (BuildContext context) => BananasScreen(),
        '/oranges' : (BuildContext context) => OrangesScreen(),
      },
    );
  }
}

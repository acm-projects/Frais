import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import  'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  // Root of the app

  @override

  Widget build (BuildContext context) {

    return MaterialApp(

      title: 'Frais App',

      theme: ThemeData(

        primarySwatch: Colors.green,

      ),

    //home: SplashPage() this is defined in French-Press splash as a loading
        // and login page.

    routes: <String, WidgetBuilder>{

      '/': (BuildContext context) => HomeScreen(),
      '/details': (BuildContext context) => DetailScreen(),
      //'/camera':
    },);
  }
}

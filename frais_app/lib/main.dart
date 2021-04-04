import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'fridge.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // Root of the app

  @override
  final Future<FirebaseApp> _fbApp = Firebase.initializeApp();
  Widget build (BuildContext context) {

    return MaterialApp(

      title: 'Frais App',

      theme: ThemeData(

        primarySwatch: Colors.green,

      ),

    home: FutureBuilder(
      future:_fbApp,
      builder: (context, snapshot){
        if (snapshot.hasError){
          print ('You have an error! ${snapshot.error.toString()}');
          return Text('Something went wrong!');
        }
        else if(snapshot.hasData){
          return HomeScreen();
        }
        else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }
    ),

    routes: <String, WidgetBuilder>{

      '/details': (BuildContext context) => DetailScreen(),
      //'/camera':
    },);
  }
}

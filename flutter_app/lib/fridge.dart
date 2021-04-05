import 'dart:ui';
import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'alert-bar.dart';


class FridgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
            children: const <Widget>[
              IconButton(
                icon: const Icon(Icons.menu),
                color: Color(0xff),
              ),
            ]
        ),
        backgroundColor: Color(0xfff7edf0),
        elevation: 0.0,
      ),
      body: new Column(
        children: <Widget>[
          Center(
            child: Container(
                margin: const EdgeInsets.all(10.0),
                width: 400.0,
                height: 160.0,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0,3),
                    )
                  ],
                  color: Color(0xff7AC313),
                ),
                // TODO: child: AlertBar(),
            ),
          ),
          Center(
              child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 400.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0,3),
                          )
                        ],
                        color: Color(0xfff5EFF4),
                      ),),
                    GridView.count(
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("Bananas", textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Oranges', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Apples', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Lemons', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Peaches', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Strawberries', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("Grapes", textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Cherries', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Avocado', textAlign: TextAlign.center,),
                            color: Color(0xff7AC313),
                          ),
                        ]
                    ),
                  ]
              ))],),
      backgroundColor: Color(0xfff7edf0),
    );
  }
}
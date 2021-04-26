import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

class BananasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
            children:<Widget>
            [
              IconButton(
                icon: Icon(Icons.arrow_back),
                color: Color(0xff),
                onPressed: (){Navigator.pop(context);},
              ),
            ]
        ),
        backgroundColor: Color(0xfff7edf0),
        elevation: 0.0,
      ),

      body: Column(
        children:
        [
          Padding(padding: EdgeInsets.all(20)),
          Stack(
            children:
            [
              Container(
                margin: const EdgeInsets.all(7),
                child: Column(
                  children: [
                    Text("Bananas",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                    Container(
                        margin: const EdgeInsets.all(10),
                        height: 300,
                        child: Column(
                          children: [
                            Padding( padding: EdgeInsets.all(7) ),
                            Row(
                              children: [
                                Padding( padding: EdgeInsets.all(0) ),
                                Expanded(
                                    child: Text('', textAlign: TextAlign.center,)
                                ),
                                Expanded(
                                    child: Text('Expires in:', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                                Expanded(
                                    child: Text('Ripe in:', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                                Expanded(
                                    child: Text('Date Added:', textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                                ),
                              ],
                            ),
                            Padding( padding: EdgeInsets.all(10) ),
                            Row(
                              children: [
                                Padding(padding:EdgeInsets.all(10)),
                                Image(
                                  image: AssetImage('graphics/rottenBanana.png'),
                                  height: 40,
                                  width: 40,
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 26)),
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                  size: 36,
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 26)),
                                Icon(
                                  Icons.cancel_outlined,
                                  color: Colors.red,
                                  size: 36,
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 26)),
                                Expanded(
                                    child: Text("04/28/2020", style: TextStyle(fontWeight: FontWeight.bold), textScaleFactor: 0.7)
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 6))
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff7edf0),
                        )
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xff7AC313),
                ),
              ),
            ],
          )
        ],
      ),

      backgroundColor: Color(0xfff7edf0),);
  }
}
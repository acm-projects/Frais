import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';


class FridgeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Row(
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
              child: Center(
                child: Container(
                  margin: const EdgeInsets.all(20.0),
                  color: Color(0xff7AC313),
                  child: Row(
                    children:
                    [
                      Stack(
                        children:
                        [
                          Container(
                            child: Image.asset('graphics/orange.png'),
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Color(0xffD2EC00),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xff36C9C6),
                                width: 7.0
                              )
                            )
                          )
                        ],
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                      Expanded(
                        child: Text('Heads Up: Your Orange May Expire Soon!',
                        textAlign: TextAlign.right,
                        style: TextStyle(color: Color(0xfff7edf0), fontWeight: FontWeight.bold)
                        ),
                      ),
                    ],
                  )
                )
              )
              // TODO: child: AlertBar(),
            ),
          ),
          Center(
              child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 400.0,
                      height: 420.0,
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
                        padding: const EdgeInsets.all(15),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {
                                Navigator.pushNamed(context, '/bananas');
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/banana.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Bananas",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {
                                Navigator.pushNamed(context, '/oranges');
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/orange.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Oranges",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {
                              },
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/apple-1.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Apples",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/lemon-1.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Lemons",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/peach.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Peaches",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/strawberry.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Strawberries",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/grapes.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Grapes",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/cherries.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Cherries",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                          Container(
                            margin: EdgeInsets.all(1),
                            height: 50.0,
                            child: RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(0.0),
                                  side: BorderSide(color: Color(0xfff7edf0))),
                              onPressed: () {},
                              padding: EdgeInsets.all(10.0),
                              color: Color(0xff7AC313),
                              textColor: Color(0xfff7edf0),
                              child: Stack(
                                  children:[
                                    //Add Image
                                    //AssetImage('graphics/apple-1.png'),
                                    Align(
                                      alignment: Alignment.topCenter,
                                      child: Image.asset('graphics/avocado.png'),
                                    ),
                                    Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("Avocado",
                                          style: TextStyle(fontSize: 15),
                                          textAlign: TextAlign.center,
                                        )
                                    )
                                  ]
                              ),
                            ),),
                        ]
                    ),
                  ]
              ))],),
      backgroundColor: Color(0xfff7edf0),
    );
  }
}
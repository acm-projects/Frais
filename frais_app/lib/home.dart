import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
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
                )
            ),
          ),
          Center(
              child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      width: 400.0,
                      height: 462.0,
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
                            child: const Text("Bananas"),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Oranges'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Apples'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Lemons'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Peaches'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Strawberries'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text("Grapes"),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Cherries'),
                            color: Color(0xff7AC313),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            child: const Text('Avocado'),
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
class DetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FlatButton(
          child: Text('Pop!'),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
import 'dart:io';
import 'dart:typed_data';
import 'dart:async';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model.dart';

class PreviewScreen extends StatefulWidget {
  final String imgPath;
  final String fileName;
  PreviewScreen({this.imgPath, this.fileName});

  @override
  _PreviewScreenState createState() => _PreviewScreenState();
}

class _PreviewScreenState extends State<PreviewScreen> {
  List _prediction;


  @override
  Widget build(BuildContext context) {

    if(_prediction == null) {
      recognizeImage(widget.imgPath);
      return Scaffold(

          appBar: AppBar(
            backgroundColor: Color(0xff7AC313),
            automaticallyImplyLeading: true,
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.file(File(widget.imgPath),fit: BoxFit.cover,),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    height: 60,
                    color: Colors.black,
                    child: Center(
                        child: Text("testing")
                    ),
                  ),
                )
              ],
            ),
          )
      );

    }

    if(_prediction.isEmpty) {

      return Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xff7AC313),
            automaticallyImplyLeading: true,
          ),
          body: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Image.file(File(widget.imgPath),fit: BoxFit.fitWidth,),
                ),
                Card(
                  color: Color(0xff7ac313),
                  child: Column(
                    children: <Widget>[Text(
                      "This input is invalid!",
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white
                      ),
                    )]
                  ),
                )
              ],
            ),
          )
      );

    }




    return Scaffold(

        appBar: AppBar(
          backgroundColor: Color(0xff7AC313),
          automaticallyImplyLeading: true,
        ),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Image.file(File(widget.imgPath),fit: BoxFit.fitWidth,),
              ),
              Card(
                color: Color(0xff7ac313),
                child: Column(
                  children: _prediction != null
                      ? _prediction.map((pre) {
                      return ClipRRect(
                        child: Text(
                          "${pre["label"]}",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white
                          ),
                        )
                      );
                    }).toList()
                      : [],
                ),
              )
            ],
          ),
        )
    );
  }

  Future recognizeImage(String path) async {
    var res = await loadModel();
    //print(res);

    //var predictions = await runModel(path);
    var prediction = await runModel(path);
    print("Prediction: ${prediction}");



    setState(() {
      _prediction = prediction;
    });
  }
  Future getBytes () async {
    Uint8List bytes = File(widget.imgPath).readAsBytesSync() as Uint8List;
//    print(ByteData.view(buffer))
    return ByteData.view(bytes.buffer);
  }
}
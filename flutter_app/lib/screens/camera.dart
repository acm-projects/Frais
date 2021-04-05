import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_app/screens/preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_app/fridge.dart';

import 'dart:math';


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

  int _counter = 0;

  void _incrementCounter() {
    DatabaseReference _testRef = FirebaseDatabase.instance.reference().child("test");
    _testRef.set("Hello world ${Random().nextInt(100)}");

    setState(() {
      _counter++;
    });}

  Future initCamera(CameraDescription cameraDescription) async {
    if (cameraController != null) {
      await cameraController.dispose();
    }

    cameraController =
        CameraController(cameraDescription, ResolutionPreset.high);

    cameraController.addListener(() {
      if (mounted) {
        setState(() {});
      }
    });

    if (cameraController.value.hasError) {
      print('Camera Error ${cameraController.value.errorDescription}');
    }

    try {
      await cameraController.initialize();
    } catch (e) {
      showCameraException(e);
    }

    if (mounted) {
      setState(() {});
    }
  }

  /// Display camera preview

  Widget cameraPreview() {
    if (cameraController == null || !cameraController.value.isInitialized) {
      return Text(
        'Loading',
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
      );
    }

    return AspectRatio(
      aspectRatio: cameraController.value.aspectRatio,
      child: CameraPreview(cameraController),
    );
  }

  Widget cameraControl(context) {
      return Row(
       // child: Align(
       //  alignment: Alignment.bottomCenter,
       //   child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(
              width: 90,
              height:90.0,
            child: FloatingActionButton(
              child: Icon(
                Icons.brightness_1_outlined,
                color: Colors.white,
                size: 90.0,
              ),
              backgroundColor: Colors.black.withOpacity(0.05),
              onPressed: () {
                onCapture(context);
              },
            ),
            )
          ],
        //),
      //),
    );
  }

  Widget cameraToggle() {
    if (cameras == null || cameras.isEmpty) {
      return Spacer();
    }

    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    CameraLensDirection lensDirection = selectedCamera.lensDirection;

    return Expanded(
      child: Align(
        alignment: Alignment.bottomRight,
        child: TextButton.icon(
            onPressed: () {
              onSwitchCamera();
            },
            icon: Icon(
              getCameraLensIcons(lensDirection),
              color: Colors.white,
              size: 24,
            ),
            label: Text(
               '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
               style:
               TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
             )
        ),
      ),
    );
  }

  onCapture(context) async {
    try {
      final p = await getTemporaryDirectory();
      final name = DateTime.now();
      final path = "${p.path}/$name.png";

      await cameraController.takePicture(path).then((value) {
        print('here');
        print(path);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>PreviewScreen(imgPath: path,fileName: "$name.png",)));
      });

    } catch (e) {
      showCameraException(e);
    }
  }

  @override
  void initState() {

    super.initState();
    availableCameras().then((value) {
      cameras = value;
      if(cameras.length > 0){
        setState(() {
          selectedCameraIndex = 0;
        });
        initCamera(cameras[selectedCameraIndex]).then((value) {

        });
      } else {
        print('No camera available');
      }
    }).catchError((e){
      print('Error : ${e.code}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(-2,-1),
              child: cameraPreview(),
            ),
            Align(
               alignment: Alignment(-1,.85),
               //child: Container(
              //   alignment: Alignment.center,
              //   height: 100,
              //   width: 200,
              //   padding: EdgeInsets.symmetric(),
              //   color: Colors.black,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    //cameraToggle(),
                    cameraControl(context),
                    //Spacer(),
                  ],
                ),
              ),
            //)
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  cameraToggle(),
                ],
              ),
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      FloatingActionButton(
                        child: Icon(
                          Icons.image,
                          color: Colors.white,
                          size: 30.0,
                        ),
                        backgroundColor: Colors.transparent,
                        onPressed: () {
                          _incrementCounter(); //TODO: REMOVE THIS AFTER DB IMPLEMENTED
                          Navigator.pushNamed(context, '/fridge');
                        },
                      ),
                    ]
                )
            )
          ],
        ),
      ),
    );
  }

  getCameraLensIcons(lensDirection) {
    switch (lensDirection) {
      case CameraLensDirection.back:
        return CupertinoIcons.switch_camera;
      case CameraLensDirection.front:
        return CupertinoIcons.switch_camera_solid;
      case CameraLensDirection.external:
        return CupertinoIcons.photo_camera;
      default:
        return Icons.device_unknown;
    }
  }

  onSwitchCamera() {
    selectedCameraIndex =
    selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
    CameraDescription selectedCamera = cameras[selectedCameraIndex];
    initCamera(selectedCamera);
  }

  showCameraException(e) {
    String errorText = 'Error ${e.code} \nError message: ${e.description}';
  }
}

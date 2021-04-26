import 'package:flutter_app/screens/preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';


class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  File _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async{
    final pickedFile = await picker.getImage(source: ImageSource.gallery);


    setState((){
      if(pickedFile != null){
        _image = File(pickedFile.path);

      } else{
        print('No image selected.');
      }
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) =>PreviewScreen(imgPath: pickedFile.path,fileName: "name.png",)));
  }

  CameraController cameraController;
  List cameras;
  int selectedCameraIndex;
  String imgPath;

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
              heroTag: "btn3",
              child: Icon(
                Icons.brightness_1_outlined,
                color: Colors.white,
                size: 80.0,
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
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment(-2,-1),
              child: cameraPreview(),
            ),
            Align(
               alignment: Alignment(-1,.945),
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
            // Align(
            //   alignment: Alignment.bottomCenter,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: <Widget>[
            //       cameraToggle(),
            //     ],
            //   ),
            // ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: size.width,
                  height: 80,
                  child: Stack(
                    children: [
                      CustomPaint(
                        size: Size(size.width, 80),
                        painter: BNBCustomPainter(),
                      ),
                      // Center(
                      //   heightFactor: .6,
                      //   child: FloatingActionButton(onPressed: (){},
                      //   backgroundColor: Colors.orange,
                      //     child: Icon(Icons.shopping_basket),elevation:.1,),
                      // ),
                      Container(
                        width: size.width,
                        height: 80,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Colors.green,
                                heroTag: "btn1",
                                child:Icon(CupertinoIcons.bag_fill),
                                onPressed:(){
                                  Navigator.pushNamed(context, '/second');
                                }
                                          ),
                            Container(width: size.width*.15,),
                            FloatingActionButton(
                              backgroundColor: Colors.green,
                                heroTag: "btn4",
                                child:Icon(Icons.image),
                                onPressed:getImageFromGallery)
                          ],
                        )
                      )
                    ],
                )



                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: <Widget>[
                //       FloatingActionButton(
                //         child: Icon(
                //           Icons.image,
                //           color: Colors.white,
                //           size: 30.0,
                //         ),
                //         backgroundColor: Colors.transparent,
                //         onPressed: () => pushNewScreenWithRouteSettings(
                //           context,
                //           screen: FridgeScreen(),
                //           withNavBar: true,
                //           pageTransitionAnimation: PageTransitionAnimation.cupertino,
                //         )
                //       ),
                //     ]
                // )
            )
            ),
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

class BNBCustomPainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0,20);
    path.quadraticBezierTo(size.width*.20, 0, size.width*.35, 0);
    path.quadraticBezierTo(size.width*.40, 0, size.width*.40, 20);
    path.arcToPoint(Offset(size.width*0.60,20),
      radius: Radius.circular(10.0),clockwise: false);
    path.quadraticBezierTo(size.width*.60, 0, size.width*.65, 0);
    path.quadraticBezierTo(size.width*.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path,Colors.white70,5,true);
    canvas.drawPath(path,paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}
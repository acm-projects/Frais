import 'package:tflite/tflite.dart';
import 'dart:async';


Future loadModel() async {
  Tflite.close();
  var res = await Tflite.loadModel(
      model: "assets/from_saved_model.tflite",
      labels: "assets/from_saved_model.txt",
      numThreads: 1, // defaults to 1
      isAsset: true, // defaults to true, set to false to load resources outside assets
      useGpuDelegate: false // defaults to false, set to true to use GPU delegate
  );

  return res;
}

//lass resultScreen extends StatelessWidget
Future runModel(String filepath) async {
  //var worked = await loadModel();
  var recognitions = await Tflite.runModelOnImage(
      path: filepath,
      imageMean: 117.0,
      // defaults to 117.0
      imageStd: 1.0,
      // defaults to 1.0
      numResults: 50, // number of times the image is ran through the model
      // defaults to 5
      threshold: 0.8, // threshold is the confidence level below which all predictions will be discarded (i.e. if threshold is .5, and the confidence of the prediction is .4, we will never even see the prediction
      // defaults to 0.1
      asynch: true // defaults to true
  );

  Tflite.close();

  return recognitions;

}
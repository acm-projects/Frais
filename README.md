# Frais

Determine the freshness of your produce using machine learning with this green-thumbed mobile app.
## MVP

At the minimum, this app will contain:
1)  A camera page:
    * Allows users to either upload a photo 
    * Take a photo of the produce they want to find out information on
2) A viewing page
    * Will show the stage that the produce is in (unripe, ripe, rotten)
    * Will show any informaton deemed necessary to the freshness of the produce (peak season, time left until rot)
    * Will allow users to save the produce to remember and get updates
3)  A saved page
    * Will show all of the produce saved by the user
## Stretch Goals

- Create user accounts
- Allow users to save "a fridge" with other people in their home, meaning that multiple users will be able to add and see the same pieces of produce as the people they share  a fridge with
- Enable popup notifications providing updates on a desired piece of produce
## Tech Stack Resources

 * IDE : [Android Studio](https://developer.android.com/studio)
    - You can really use any text editor you prefer (VSCode, etc) but I really like Android Studio, I've used it for many projects and find it very reliable especially when for making cross compatible mobile apps    
* Machine learning API: 
  * [Cloud Vision API](hhttps://cloud.google.com/vision)
    * Google's ML API, seems to have everything you might need, however we do not get the advantage of making our own compelte custom models (which I recommend for experience)
    * [Google's Documentaiton](https://cloud.google.com/vision/docs/tutorials) 
    * [Cloud Vision API with Python](https://codelabs.developers.google.com/codelabs/cloud-vision-api-python#0)
    * [Image recognition video](https://www.youtube.com/watch?v=BN8aO0LULyw)
* Alternative:
  * Make our own complete models using [TenserFlow Lite](https://www.tensorflow.org/lite). I would recommend this option over using the Cloud Recognition API as this will give us complete control over our ML model
    * [Getting starte with Tensorflow Lite](https://www.tensorflow.org/lite/guide/get_started)
    * [Tensorflow lite with Flutter](https://medium.com/flutterdevs/implementing-tensorflow-lite-in-flutter-c21738e9d35c) 
    * [Image recognition with Flutter and Tenserflow Lite](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjjpcjcpdvuAhWRAZ0JHTETAm4QFjAEegQIBRAC&url=https%3A%2F%2Fheartbeat.fritz.ai%2Fbuilding-a-cross-platform-image-classifier-with-flutter-and-tensorflow-lite-c7789af9b33a&usg=AOvVaw0rYWR_gbhCyWdS45mfuTxN)
  * If you do choose this route, to store the images I recommend storing our dataset in [Kaggle](https://www.kaggle.com/_)
* Framework/language: Flutter or React Native
  * [Flutter](https://flutter.dev/docs):
     * Uses [Dart](https://dart.dev/) as a language
     * Has LOTS of [documentation](https://flutter.dev/docs)
     * [Using the camera with flutter](https://www.raywenderlich.com/4333657-using-the-camera-on-flutter)
  * [React Native](https://reactnative.dev/docs/environment-setup)
    * Uses [Javascript](https://www.javascript.com/resources)
    * [React Native Camera](https://docs.expo.io/versions/latest/sdk/camera/)
  * Really either one of these works, however I think Flutter has the upperhand in terms of compatibility with Tensor Flow, Cloud Vision API and Firebase
* Database:
  * Used to store our information about the produce (average timeline of the produce, seasonality, etc)
  * [Firebase](https://firebase.google.com/), made by google, also has services making it easier to train our ML Models
  * [Firebase and flutter](https://www.youtube.com/watch?v=sfA3NWDBPZ4&list=PL4cUxeGkcC9j--TKIdkb3ISfRbJeJYQwC)
* [Gitbash](https://gitforwindows.org/)
  * A very useful [Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf) of commands you will use






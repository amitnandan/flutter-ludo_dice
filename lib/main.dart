import 'package:Dice_roll/splash.dart';
import 'package:flutter/material.dart'
    show BuildContext, MaterialApp, StatelessWidget, Widget, runApp;
import 'package:Dice_roll/homescreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key:key}:super(key:key);
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Roll_Dice",
      home: HomeScreen(),
    ); //Material App
  }
}

/*
  *Another way to Add a Splash Screen // Demerit is that their will still show
  * a white background as you start the screen
  * That is the default white background shown
  * NATIVE in ANDROID
  * one of the way to add a splash screen

  AnimatedSplash(
      imagePath: 'assets/flutter_icon.png',
      home: Home(),
      customFunction: duringSplash,
      duration: 2500,
      type: AnimatedSplashType.BackgroundProcess,
      outputAndHome: op,
    ),
*/
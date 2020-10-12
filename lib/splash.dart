/*
* In this Splash screen , as you open it
* it will show a message "ROLL THE DICE "
* for 3 sec and then homescreen will open up
* IT is not attached in the Main App
* ITS only to learn
* one of the ways to add splash screen
*/



import 'dart:async';
import 'dart:ui';
import 'package:shimmer/shimmer.dart' show Shimmer;
import 'package:Dice_roll/homescreen.dart' show HomeScreen;
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  void dispose() {
    super.dispose();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          alignment: Alignment.center,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.lime, Colors.lightBlue],
            ),
          ),
          child: Shimmer.fromColors(
            baseColor: Color(0xff7f00ff),
            highlightColor: Color(0xffe100ff),
            child: Text(
              'ROLL THE DICE ',
              style: TextStyle(
                fontFamily: 'Pacifico',
                fontSize: 60,
                shadows: <Shadow>[
                  Shadow(
                    blurRadius: 18,
                    color: Colors.black87,
                    offset: Offset.fromDirection(90, 2),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
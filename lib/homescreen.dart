import 'dart:math';

import 'package:flutter/cupertino.dart' show AssetImage, BuildContext, Center, Column, Expanded, GestureDetector, Image, MainAxisAlignment, Row, SingleTickerProviderStateMixin, State, StatefulWidget, Text, TickerProviderStateMixin, Widget;
import 'package:flutter/material.dart'
    show AppBar, AssetImage, BuildContext, Center, Column, Expanded, Image, RaisedButton, Row, Scaffold, State, StatefulWidget, Text, Widget;
// ignore: implementation_imports
import 'package:flutter/src/widgets/basic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
//Ticker Provider
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  int leftDiceNumber = 1 ;
  int rightDiceNumber = 1 ;
  AnimationController _controller;
  CurvedAnimation animation;

  @override
  void initState() {
    super.initState();
    animate();
  }
  @override
  void dispose(){
    super.dispose();
    _controller.dispose();
  }

  animate() {
    _controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = CurvedAnimation(
        parent: _controller, curve: Curves.bounceOut);
    _controller.addListener(() {
      setState(() {

      });
    });
    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          leftDiceNumber = Random().nextInt(6) + 1;
          rightDiceNumber = Random().nextInt(6) + 1;
        });
        _controller.reverse();
      }
    });
  }





  void roll()
  {
    _controller.forward();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Roll_Dice'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
            children: [
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onDoubleTap:roll,
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Image(
                      height:200-(animation.value)*200,
                      image: AssetImage("assets/images/dice-png-$leftDiceNumber.png"),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onDoubleTap: roll,
                  child: Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: Image(
                      height:200-(animation.value)*200,
                      image: AssetImage("assets/images/dice-png-$rightDiceNumber.png"),
                    ),
                  ),
                ),
              )
            ],
          ),
          RaisedButton(onPressed:roll,
          child: Text('ROLL'),
          )
        ]),
      ),
    );
  }
}

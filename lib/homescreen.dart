import 'dart:math';

import 'package:flutter/cupertino.dart' show AssetImage, BuildContext, Center, Column, Expanded, Image, MainAxisAlignment, Row, State, StatefulWidget, Text, Widget;
import 'package:flutter/material.dart'
    show AppBar, AssetImage, BuildContext, Center, Column, Expanded, Image, RaisedButton, Row, Scaffold, State, StatefulWidget, Text, Widget;
import 'package:flutter/src/widgets/basic.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int leftDiceNumber = 1 ;
  int rightDiceNumber = 1 ;
  void roll()
  {
    setState(() {
      leftDiceNumber = Random().nextInt(6)+1;
      rightDiceNumber = Random().nextInt(6)+1;
    });
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
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Image(
                    image: AssetImage("assets/images/dice-png-$leftDiceNumber.png"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:  EdgeInsets.all(15.0),
                  child: Image(
                    image: AssetImage("assets/images/dice-png-$rightDiceNumber.png"),
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

import 'package:checklist/widgets/clock_dialog.dart';
import 'package:checklist/widgets/clock_face.dart';
import 'package:checklist/widgets/clock_hands.dart';
import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: <Widget>[
          Center(
            child: ClockFace(
              width: 320.0,
              height: 320.0,
            ),
          ),
          Center(
            child: Container(
              child: CustomPaint(
                size: Size(300, 300),
                painter: ClockDialog(),
              ),
            ),
          ),
          Center(
            child: ClockHands(),
          )
        ],
      ),
    );
  }
}

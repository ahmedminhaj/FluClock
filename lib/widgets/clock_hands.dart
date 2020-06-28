import 'dart:async';

import 'package:checklist/clock/hours.dart';
import 'package:checklist/clock/minutes.dart';
import 'package:checklist/clock/seconds.dart';
import 'package:checklist/clock/task_pointer.dart';
import 'package:flutter/material.dart';

class ClockHands extends StatefulWidget {
  @override
  _ClockHandsState createState() => _ClockHandsState();
}

class _ClockHandsState extends State<ClockHands> {
  Timer _timer;
  DateTime dateTime;

  @override
  void initState() {
    super.initState();
    dateTime = new DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), setTime);
  }

  void setTime(Timer timer){
    setState(() {
      dateTime = DateTime.now();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: TaskPointer(
              hours: 8,
              minutes: 30,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: TaskPointer(
              hours: 3,
              minutes: 45,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: TaskPointer(
              hours: 2,
              minutes: 25,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: Seconds(
              seconds: dateTime.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: Minutes(
              minutes: dateTime.minute,
              seconds: dateTime.second,
            ),
          ),
        ),
        Container(
          child: CustomPaint(
            size: Size(280, 280),
            painter: Hours(
              hours: dateTime.hour,
              minutes: dateTime.minute,
            ),
          ),
        ),
        
      ],
    );
  }
}
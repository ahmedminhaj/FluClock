import 'dart:math';

import 'package:flutter/material.dart';

class TaskPointer extends CustomPainter {
  final Paint hourHandPaint;

  final int hours;
  final int minutes;

  TaskPointer({this.hours, this.minutes}) : hourHandPaint = new Paint() {
    hourHandPaint.color = Colors.teal[400];
    hourHandPaint.style = PaintingStyle.stroke;
    hourHandPaint.strokeWidth = 20.0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    canvas.save();
    canvas.translate(radius, radius);

    canvas.rotate(this.hours >= 12
        ? 2 * pi * ((this.hours - 12) / 12 + (this.minutes / 720))
        : 2 * pi * ((this.hours / 12) + (this.minutes / 720)));

    Path path = new Path();
    path.moveTo(0.0, -(radius + 18));
    path.lineTo(0.0, -138.0);
    canvas.drawPath(path, hourHandPaint);
    canvas.restore();

  }

  @override
  bool shouldRepaint(TaskPointer oldDelegate) {
    return this.minutes != oldDelegate.minutes;
  }
}
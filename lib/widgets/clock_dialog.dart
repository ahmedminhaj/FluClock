import 'dart:math';

import 'package:flutter/material.dart';

class ClockDialog extends CustomPainter {
  final hourTickerMarkLength = 10.0;
  final minuteTickerMarkLength = 5.0;

  final hourTickerMarkwidth = 3.0;
  final minuteTickerMarkwidth = 1.5;

  final Paint tickerPaint;
  final TextPainter textPainter;
  final TextStyle textStyle;

  ClockDialog()
      : tickerPaint = Paint(),
        textPainter = TextPainter(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
        ),
        textStyle = const TextStyle(
          color: Colors.grey,
          fontSize: 20.0,
        ) {
    tickerPaint.color = Colors.white;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var tickMarkLength;
    final angle = 2 * pi / 60;
    final radius = size.width / 2;
    canvas.save();

    canvas.translate(radius, radius);
    for(var i = 0; i < 60; i++){
      tickMarkLength = i % 5 ==  0 ? hourTickerMarkLength : minuteTickerMarkLength;
      tickerPaint.strokeWidth = i % 5 == 0 ? hourTickerMarkwidth : minuteTickerMarkwidth;
      canvas.drawLine(Offset(0.0, -radius), Offset(0.0, -radius + tickMarkLength), tickerPaint);

      if(i%20 == 0){
        canvas.save();
        canvas.translate(0.0, -radius + 20.0);

        textPainter.text = TextSpan(
          text: '${i == 0 ? 12 : i ~/ 5}',
          style: textStyle,
        );

        canvas.rotate(-angle * i);

        textPainter.layout();
        textPainter.paint(canvas, Offset(-(textPainter.width / 2), -(textPainter.height / 2)));
        canvas.restore();
      }
      canvas.rotate(angle);
    } 
    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

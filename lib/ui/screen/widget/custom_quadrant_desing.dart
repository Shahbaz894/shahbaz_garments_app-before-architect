import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.green // Color for filling
      ..style = PaintingStyle.fill; // Fill instead of stroke

    double centerX = size.width / 2;
    double centerY = size.height / 2;
    double radius = min(centerX, centerY);

    Rect rect = Rect.fromCircle(center: Offset(centerX, centerY), radius: radius);

    // Draw the third quadrant of the circle
    canvas.drawArc(rect, -pi, -pi / 2, true, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
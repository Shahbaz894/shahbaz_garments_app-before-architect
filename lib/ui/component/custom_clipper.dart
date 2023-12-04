import 'package:flutter/material.dart';

class Customshape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Define the circle's center and radius
    // double centerX = size.width / 2;
    // double centerY = size.height / 2;
    // double radius = size.width / 2;
    //
    // path.moveTo(centerX, centerY); // Move to the center of the circle
    // path.lineTo(centerX, 0); // Draw a line from the center to the top
    // path.arcTo(
    //   Rect.fromCircle(center: Offset(centerX, centerY), radius: radius),
    //   -0.5 * (3.1415927), // Start angle (0 degrees in radians)
    //   -0.5 * (3.1415927), // Sweep angle (90 degrees in radians)
    //   false,
    // );
    //
    // // Close the path by adding a line to the bottom-right corner
    // path.lineTo(centerX, centerY);
    path.lineTo(0, size.height);
    //path.lineTo(size.width, size.height);
    //path.lineTo(size.width, size.height);
    path.quadraticBezierTo(0, 1, size.width/2, size.height);
    path.lineTo(size.width, 0);
     // path.quadraticBezierTo(0, 0, 0, size.height);
     // path.quadraticBezierTo(0, 0, 0, size.width);


    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

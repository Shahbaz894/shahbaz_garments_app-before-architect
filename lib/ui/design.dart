// import 'package:flutter/material.dart';
//
// class CirclePainter extends CustomPainter {
//   final Color color;
//
//   CirclePainter({
//     required this.color,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final paint = Paint()..color = color;
//     canvas.drawCircle(Offset(size.width / 2, size.height / 2), size.width / 2, paint);
//   }
//
//   @override
//   bool shouldRepaint(covariant CirclePainter oldDelegate) {
//     return color == oldDelegate.color;
//   }
// }
//
// class ColorAreaCircle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return CustomPaint(
//       painter: CirclePainter(
//         color: Colors.red,
//       ),
//     );
//   }
// }
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BezierCurvePainter extends CustomPainter {
  final Color color;

  BezierCurvePainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;
    final path = Path();

    // Move to the top-left corner
    path.moveTo(0, size.height);

    // Draw a quadratic Bezier curve representing the third quadrant
    path.quadraticBezierTo(
      size.width * 0.25,
      size.height * 0.75,
      size.width * 0.1,
      size.height * 4,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.10,
      size.width,
      0,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant BezierCurvePainter oldDelegate) {
    return color == oldDelegate.color;
  }
}


class BezierCurveAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      title: Align(
        alignment: Alignment.topLeft,
        child: Container(
          margin: EdgeInsets.only(left: 16.0, top: 8.0),
          child: CustomPaint(
            size: Size(200, 200),
            painter: BezierCurvePainter(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}


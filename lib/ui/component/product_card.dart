import 'package:flutter/material.dart';

class EggShapeCard extends StatelessWidget {
  final Widget image;
  final String title;

  EggShapeCard({required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: EggShapeClipper(),
      child: Card(
        elevation: 5,
        child: Column(
          children: <Widget>[
            image, // Use the provided image widget
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EggShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(size.width / 2, 0);
    path.quadraticBezierTo(size.width / 4, size.height * 0.9, 0, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

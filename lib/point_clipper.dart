import 'package:flutter/material.dart';

class PointyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height * 0.5); // Starting point
    path.lineTo(size.width * 0.2, 0); // Top-left point
    path.lineTo(size.width * 0.8, 0); // Top-right point
    path.lineTo(size.width, size.height * 0.5); // Bottom-right point
    path.lineTo(size.width * 0.8, size.height); // Bottom-right corner
    path.lineTo(size.width * 0.2, size.height); // Bottom-left corner
    path.close(); // Closing the path
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

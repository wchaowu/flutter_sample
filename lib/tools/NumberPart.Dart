import 'package:flutter/material.dart';

class NumberPart extends CustomClipper<Path> {
  final double radius;

  NumberPart({this.radius});
  Path getClip(Size size) {
    final path = Path()
      ..lineTo(0.0, 0.0)
      ..lineTo(0.0, size.height)
      ..lineTo(size.width / 1.3 - 5, size.height / 1.3)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, 0.0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(NumberPart numberPart) {
    return this.radius != numberPart.radius;
  }
}

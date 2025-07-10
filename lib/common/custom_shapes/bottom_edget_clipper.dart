import 'package:flutter/material.dart';

class BottomEadgedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    final firstOffset = Offset(0, size.height - 20);
    final secondOffset = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstOffset.dx, firstOffset.dy, secondOffset.dx, secondOffset.dy);

    final firstCurve = Offset(0, size.height - 20);
    final secondCurve = Offset(size.width - 30, size.height - 20);
    path.quadraticBezierTo(firstCurve.dx, firstCurve.dy, secondCurve.dx, secondCurve.dy);

    final thirdOffset = Offset(size.width, size.height - 20);
    final fourthOffset = Offset(size.width, size.height);

    path.quadraticBezierTo(thirdOffset.dx, thirdOffset.dy, fourthOffset.dx, fourthOffset.dy);

    path.lineTo(size.width, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

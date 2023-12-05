import 'package:flutter/material.dart';

import '../colors/colors.dart';

class LoginSignupCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(
      0,
      size.height * 0.1600000,
      size.width * 0.2325581,
      size.height * 0.1613333,
    );

    path0.lineTo(
      size.width * 0.7674419,
      size.height * 0.16113333,
    );

    path0.quadraticBezierTo(
      size.width,
      size.height * 0.1631733,
      size.width,
      size.height * 0.32,
    );
    path0.lineTo(
      size.width,
      size.height,
    );
    path0.lineTo(
      0,
      size.height,
    );
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*class CustomizedCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.quadraticBezierTo(size.width * 0.0068140, size.height * 0.1600000,
        size.width * 0.2325581, size.height * 0.1613333);
    path0.cubicTo(
        size.width * 0.3488372,
        size.height * 0.1613333,
        size.width * 0.5813953,
        size.height * 0.1613333,
        size.width * 0.6976744,
        size.height * 0.1613333);
    path0.quadraticBezierTo(size.width * 0.9948605, size.height * 0.1631733,
        size.width, size.height * 0.3186667);
    path0.lineTo(size.width, size.height);
    path0.lineTo(0, size.height);
    path0.lineTo(0, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}*/

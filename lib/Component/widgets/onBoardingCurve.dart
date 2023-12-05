import 'package:flutter/cupertino.dart';
import 'package:travita/Component/colors/colors.dart';

class BoardingCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(
      size.width,
      0,
    );
    path0.quadraticBezierTo(
      size.width,
      size.height * 0.1600000,
      size.width * 0.7674419,
      size.height * 0.1600000,
    );

    path0.lineTo(
      size.width * 0.2325581,
      size.height * 0.1613333,
    );

    path0.quadraticBezierTo(
      0,
      size.height * 0.1600000,
      0,
      size.height * 0.32,
    );
    path0.lineTo(
      0,
      size.height,
    );
    path0.lineTo(
      size.width,
      size.height,
    );
    path0.lineTo(
      size.width,
      0,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

/*class BoardingCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = AppColors.darkBlue
      ..style = PaintingStyle.fill;

    Path path0 = Path();
    path0.moveTo(
      size.width,
      0,
    );
    path0.quadraticBezierTo(
      size.width * 1,
      size.height * 0.2109053,
      size.width * 0.6,
      size.height * 0.2119368,
    );
    path0.cubicTo(
      size.width * 1,
      size.height * 0.2124632,
      size.width * 1,
      size.height * 0.2092842,
      size.width * 1,
      size.height * 0.2098105,
    );
    path0.quadraticBezierTo(
      size.width * 0.0032326,
      size.height * 0.2101474,
      0,
      size.height * 0.4198526,
    );
    path0.lineTo(
      0,
      size.height,
    );
    path0.lineTo(
      size.width,
      size.height,
    );
    path0.lineTo(
      size.width,
      0,
    );
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}*/

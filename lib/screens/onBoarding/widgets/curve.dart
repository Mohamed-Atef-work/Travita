import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/widgets/onBoardingCurve.dart';


class OnBoardingCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(
        double.infinity,
        double.infinity,
      ),
      painter: BoardingCurve(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingImage extends StatelessWidget {
  const OnBoardingImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: 65.h,
      ),
      child: Image.asset(
        "image/onBoardingThree.png",
        height: 400.h,
        width: 330.w,
      ),
    );
  }
}

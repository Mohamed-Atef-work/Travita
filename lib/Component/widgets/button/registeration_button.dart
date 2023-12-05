import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/colors.dart';

Widget RegisterationButton({
  required String name,
  double? width,
  double? height,
  double? fontSize,
}) =>
    Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            20.r,
          ),
          gradient: const LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
                AppColors.blue,
                AppColors.darkOrange,
              ])),
      child: Center(
        child: Text(
          name,
          style: TextStyle(
            color: AppColors.white,
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
          ),
        ),
      ),
    );

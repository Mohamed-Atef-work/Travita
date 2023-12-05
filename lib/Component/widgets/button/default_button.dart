import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../colors/colors.dart';

class DefaultButton extends StatelessWidget {
  late final Function() onPressed;
  late final double width;
  late final double height;
  late final Color backgroundColor;
  late final String text;
  late final double? fontSize;
  late final double? opacity;
  late final double? borderRadius;
  late final FontWeight? fontWeight;
  late final Color? textColor;
  DefaultButton({
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.fontSize,
    this.opacity,
    this.borderRadius,
    this.fontWeight,
    this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(opacity!),
          borderRadius: BorderRadius.circular(borderRadius!),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: fontWeight,
              color: AppColors.white,
            ),
          ),
        ),
      ),
    );
  }
}

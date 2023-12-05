import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';

class DefaultOutlinedButton extends StatelessWidget {
  late final String text;
  late final Function onPressed;
  late final double width;
  late final double height;
  late final Color backgroundColor;

  late final int? borderRadius;
  late final double? fontSize;
  late final FontWeight? fontWeight;
  late final Color? textColor;
  late final double? elevation;

  DefaultOutlinedButton({
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.borderRadius = 14,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        onPressed();
      },
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.darkBlue,
        side: const BorderSide(
          style: BorderStyle.none,
        ),
        fixedSize: Size(width, height),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!.r),
        ),
        elevation: elevation,
      ),
      child: DefaultText(
        text: text,
        fontWeight: fontWeight,
        fontSize: fontSize,
        textColor: textColor,
      ),
    );
  }
}

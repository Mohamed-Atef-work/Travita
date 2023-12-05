import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';

class LocationButtonWidget extends StatelessWidget {
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
  IconData? icon;
  LocationButtonWidget({
    super.key,
    this.icon,
    this.fontSize,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.text,
    this.borderRadius = 14,
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
          style: BorderStyle.solid,
        ),
        fixedSize: Size(width, height),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius!.r),
        ),
        elevation: elevation,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(icon),
          DefaultText(
            text: text,
            fontWeight: FontWeight.w600,
            fontSize: fontSize!,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

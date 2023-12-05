import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/widgets/defaultText.dart';

class SubType extends StatelessWidget {
  void Function() onTap;
  String surveyCategoriesText;
  Color oneCategoryOfSurveyColor;
  Color iconAndTextColor;

  SubType({
    super.key,
    required this.onTap,
    required this.surveyCategoriesText,
    required this.oneCategoryOfSurveyColor,
    required this.iconAndTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(22.r),
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 7.h,
        ),
        decoration: BoxDecoration(
          color: oneCategoryOfSurveyColor,
          borderRadius: BorderRadius.circular(22.r),
        ),
        child: DefaultText(
          text: surveyCategoriesText,
          textColor: iconAndTextColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/button/DefaultOutlindedButton.dart';
import '../../../Component/widgets/defaultText.dart';

class AiOrManualPlan extends StatelessWidget {
  double containerWidth;
  double containerHeight;

  String firstText;
  String secondText;
  String buttonText;

  double? secondTextLineHeight;

  Function onPressed;
  double buttonWidth;
  double buttonHeight;
  //double elevation;
  //Color buttonBackgroundColor = AppColors.darkOrange;

  AiOrManualPlan({
    required this.containerWidth,
    required this.containerHeight,
    //this.elevation,
    required this.firstText,
    required this.secondText,
    required this.onPressed,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.buttonText,
    this.secondTextLineHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: containerWidth,
      height: containerHeight,
      padding: EdgeInsets.symmetric(
        horizontal: 37.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28.r),
        border: Border.all(
          color: AppColors.blue,
        ),
        color: AppColors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          DefaultText(
            text: firstText,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
            textColor: AppColors.blue,
          ),
          DefaultText(
            text: secondText,
            fontSize: 16.sp,
            fontWeight: FontWeight.w300,
            textColor: AppColors.darkGrey,
            lineHeight: secondTextLineHeight,
          ),
          DefaultOutlinedButton(
            onPressed: () {
              onPressed();
            },
            text: buttonText,
            backgroundColor: AppColors.darkOrange,
            width: buttonWidth,
            height: buttonHeight,
            textColor: AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 25.sp,
            elevation: 10.r,
          ),
        ],
      ),
    );
  }
}

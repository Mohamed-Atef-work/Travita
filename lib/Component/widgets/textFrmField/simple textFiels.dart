import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';

import '../../colors/colors.dart';
import 'dfaultTextFormField.dart';

class SimpleTextFormFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? Function(String?)? validate;
  final Color borderColor;
  //
  final IconData? icon;
  final String? type;
  const SimpleTextFormFiled({
    super.key,
    required this.icon,
    required this.type,
    required this.controller,
    required this.validate,
    this.borderColor = AppColors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColors.darkBlue,
            ),
            SizedBox(
              width: 12.h,
            ),
            DefaultText(
              text: type!,
              textColor: AppColors.darkBlue,
              fontWeight: FontWeight.w600,
              fontSize: 25.sp,
            )
          ],
        ),
        SizedBox(
          height: 16.h,
        ),
        DefaultFormField(
          borderColor: borderColor,
          width: double.infinity,
          height: 50.h,
          controller: controller,
          type: TextInputType.text,
          validate: validate,
          textColor: AppColors.blue,
          cursorColor: AppColors.blue,
          isPassword: false,
        ),
        SizedBox(
          height: 38.h,
        ),
        /*TextFormField(
          decoration: InputDecoration(
            constraints: const BoxConstraints(maxHeight: 50, minHeight: 10),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: AppColors.zety),
            ),
            border: const OutlineInputBorder(),
          ),
        ),*/
      ],
    );
  }
}

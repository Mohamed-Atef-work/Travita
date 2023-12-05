import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigator.dart';

import '../../../../Component/widgets/defaultText.dart';

class ViewMoreButtonWidget extends StatelessWidget {
  late final Function() onTap;

  ViewMoreButtonWidget({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: onTap,
        child: DefaultText(
          text: 'View more',
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          textColor: AppColors.darkOrange,
        ),
      ),
    );
  }
}

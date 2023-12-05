import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/defaultText.dart';

class OnePlanWidget extends StatelessWidget {
  const OnePlanWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 175,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "image/plan1.png",
            height: 118.h,
            width: 175,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 20,
            width: 177,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => const Icon(
                Icons.star_border_purple500_outlined,
                color: AppColors.darkOrange,
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 6.7.w,
              ),
              itemCount: 5,
            ),
          ),
          SizedBox(
            height: 8.6.h,
          ),
          DefaultText(
            text: "Plan 1",
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
          ),
          SizedBox(
            height: 8.h,
          ),
          DefaultText(
            text:
                "Lorem ipsum dolor sit amet consectetur. Sed mi nunc sed urna sed .",
            fontWeight: FontWeight.w400,
            fontSize: 12.sp,
            textColor: AppColors.darkGrey,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

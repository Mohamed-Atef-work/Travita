import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';

class Comment extends StatelessWidget {
  String image;
  String name;
  String comment;
  Comment({required this.image, required this.name, required this.comment});
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 25.r,
          backgroundImage: AssetImage(image),
        ),
        SizedBox(
          width: 5.w,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    color: AppColors.darkBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                comment,
                style: TextStyle(
                  color: AppColors.darkGrey,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/navigator.dart';

import '../../../screens/Places_of_type/Models/restaurantsModel.dart';
import '../../colors/colors.dart';
import '../defaultText.dart';

class Category extends StatelessWidget {
  late final DetailsModel detailsModel;
  late final void Function() onTap;
  Category({
    required this.detailsModel,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 175.w,
            height: 130.h,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: detailsModel.image != null
                ? Image.network(
                    detailsModel.image!,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    "image/coffee.png",
                  ),
          ),
          SizedBox(
            height: 10.h,
          ),
          DefaultText(
            text: detailsModel.name,
            fontWeight: FontWeight.w600,
            fontSize: 16.sp,
            textColor: AppColors.darkBlue,
            textAlign: TextAlign.left,
          ),
          SizedBox(
            height: 4.h,
          ),
          DefaultText(
            text: detailsModel.description ?? detailsModel.address!,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            textColor: AppColors.darkGrey,
            maxLines: 3,
            textOverflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}

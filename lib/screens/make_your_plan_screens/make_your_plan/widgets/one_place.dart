import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';

import '../../../../Component/colors/colors.dart';
import '../../../../Component/widgets/defaultText.dart';

class OnePlaceMakeYourPlanWidget extends StatelessWidget {
  final DetailsModel detailsModel;

  const OnePlaceMakeYourPlanWidget({
    super.key,
    required this.detailsModel,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 275.w,
      height: 183.h,
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Image.network(
            detailsModel.image!,
            width: 275.w,
            height: 183.h,
            fit: BoxFit.fill,
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: 5.h,
              left: 5.w,
            ),
            child: DefaultText(
              text: detailsModel.name,
              fontSize: 25.sp,
              fontWeight: FontWeight.w600,
              textColor: AppColors.white,
              textOverflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}

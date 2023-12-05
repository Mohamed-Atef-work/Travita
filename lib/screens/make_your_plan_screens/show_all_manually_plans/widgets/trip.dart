import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/screens/make_your_plan_screens/show_manually_plan/view.dart';

import '../../../../Component/colors/colors.dart';
import '../../../../Component/widgets/defaultText.dart';
import '../../more_places/models/trip_model.dart';

class OneManuallyPlanWidget extends StatelessWidget {
  final Trips trip;

  const OneManuallyPlanWidget({super.key, required this.trip});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {
        defaultNavigator(context,  ShowManuallyPlan(tripId: trip.id,));
      },
      icon: Image.asset(
        "image/plan.png",
        width: 200.w,
        height: 150.h,
      ),
      label: Column(
        children: [
          DefaultText(
            text: trip.name,
            textColor: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
          DefaultText(
            text: trip.createdAt,
            textColor: AppColors.darkBlue,
            fontWeight: FontWeight.w600,
            fontSize: 20.sp,
          ),
        ],
      ),
    );
  }
}

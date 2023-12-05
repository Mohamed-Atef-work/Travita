import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/Details/view.dart';
import 'package:travita/screens/show_AI_plan/controller/controller.dart';
import 'package:travita/screens/show_AI_plan/widgets/place_AI_plan.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/defaultText.dart';
import '../models/model.dart';

class AllPlacesOneDayWidget extends StatelessWidget {
  final Day day;
  final int dayIndex;

  const AllPlacesOneDayWidget({
    super.key,
    required this.day,
    required this.dayIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: 'Day ${dayIndex + 1}',
          fontWeight: FontWeight.bold,
          fontSize: 23.sp,
          textColor: AppColors.darkBlue,
        ),
        Column(
          children: List.generate(
            day.places.length,
            (index) => PlaceAIPlanWidget(
              onTap: () {
                AppController.get(context).detailsModels = day.places;
                AppController.get(context).detailsModel = day.places[index];
                defaultNavigator(context, const DetailsScreen());
              },
              place: day.places[index],
            ),
          ),
        ),
        const Divider(
          color: AppColors.darkBlue,
          thickness: .5,
        ),
      ],
    );
  }
}

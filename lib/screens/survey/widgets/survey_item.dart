import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/Details/view.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/survey/controller/controller.dart';

import '../../../Component/widgets/defaultText.dart';

class OneCategoryOfSurvey extends StatelessWidget {
  late final DetailsModel surveyDetails;
  late final int itemIndex;
  /*late final String nameOfCategory;
  late final String image;
  late final String imageId;
  late final int index;*/

  // OneCategoryOfSurvey({required this.nameOfCategory, required this.image});
  OneCategoryOfSurvey({
    required this.surveyDetails,
    required this.itemIndex,
    /*required this.nameOfCategory,
    required this.image,
    required this.imageId,
    required this.index,*/
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 167.h,
      child: TextButton.icon(
        onPressed: () {
          AppController.get(context).detailsModel = surveyDetails;
          AppController.get(context).detailsModels = SurveyController.get(context).placesModel!.data;
          defaultNavigator(context, const DetailsScreen());
        },
        icon: Image.network(
          surveyDetails.image!,
          fit: BoxFit.cover,
          height: double.infinity,
          width: 180.w,
        ),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  DefaultText(
                    text: surveyDetails.name,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.blue,
                    textAlign: TextAlign.left,
                    //textOverflow: TextOverflow.ellipsis,
                    fontSize: 20.sp,
                  ),
                  SurveyController.get(context).isRated[itemIndex]
                      ? DefaultText(
                          text: "Done",
                          fontWeight: FontWeight.w600,
                          textColor: AppColors.darkOrange,
                          //textOverflow: TextOverflow.ellipsis,
                          fontSize: 15.sp,
                        )
                      : Rate(
                          color: AppColors.darkOrange,
                          iconSize: 30.r,
                          // readOnly: true,
                          onChange: (value) {
                            SurveyController.get(context).sendRate(
                              imageId: surveyDetails.id.toString(),
                              rate: value.toInt().toString(),
                              index: itemIndex,
                            );
                            print(value);
                          },
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

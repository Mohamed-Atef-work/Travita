import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/Details/view.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/widget/show_model_sheet/base_model_sheet.dart';

class OnePlaceInMorePlaceWidget extends StatelessWidget {
  final DetailsModel place;

  const OnePlaceInMorePlaceWidget({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton.icon(
          onPressed: () {
            /////////////////////////////////////////////////
            AppController.get(context).detailsModel = place;
            /////////////////////////////////////////////////
            defaultNavigator(context, DetailsScreen());
          },
          icon: Image.network(
            place.image!,
            height: 166.h,
            width: 183.w,
            fit: BoxFit.cover,
          ),
          label: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 166.h,
                width: 150.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DefaultText(
                      text: place.name,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp,
                      textColor: AppColors.darkBlue,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.fade,
                    ),
                    DefaultText(
                      text: place.description ?? place.address ?? "UnKnown",
                      fontWeight: FontWeight.w300,
                      fontSize: 12.sp,
                      textColor: AppColors.grey,
                      textAlign: TextAlign.left,
                      textOverflow: TextOverflow.fade,
                    ),
                    Rate(
                      color: AppColors.darkOrange,
                      initialValue: place.rating?.toDouble() ?? 0.0,
                      readOnly: true,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 21.w,
                height: 22.h,
                child: GestureDetector(
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      builder: (BuildContext context) => BaseModelSheetWidget(
                        placeDetails: place,
                      ),
                    );
                  },
                  child: Image.asset(
                    'image/addToPlan.png',
                  ),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          height: 0,
          color: AppColors.darkBlue,
          thickness: .5,
        ),
      ],
    );
  }
}

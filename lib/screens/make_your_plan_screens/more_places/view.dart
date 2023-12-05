import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/controller/controller.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/controller/states.dart';

import '../../AI_plan_survey/Widget/location_button.dart';
import 'widget/one_place.dart';

class MorePlacesScreen extends StatelessWidget {
  final String placeType;
  final List<DetailsModel> places;

  const MorePlacesScreen({
    super.key,
    required this.placeType,
    required this.places,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Image.asset(
          "image/appBarLogo.png",
          width: 100.w,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 15.h,
          left: 15.w,
          right: 15.w,
        ),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: placeType,
                  textColor: AppColors.darkBlue,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w600,
                ),
                LocationButtonWidget(
                  backgroundColor: Colors.white,
                  height: 56.h,
                  width: 163.w,
                  fontSize: 25.sp,
                  text: "Filters",
                  icon: Icons.filter,
                  onPressed: () {
                    //defaultNavigator(context, const FiltrationScreen());
                  },
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            DefaultText(
              text: "500 of 600 places are available, sorted by best value",
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10.h,
            ),
            DefaultText(
              text: "best value",
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              textColor: AppColors.darkOrange,
              textAlign: TextAlign.left,
            ),
            SizedBox(
              height: 10.h,
            ),
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => OnePlaceInMorePlaceWidget(
                place: places[index],
              ),
              itemCount: 15,
              itemBuilder: (context, index) => SizedBox(
                height: 10.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

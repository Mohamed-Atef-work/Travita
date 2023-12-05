import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/make_your_plan_screens/make_your_plan/widgets/view_more_button.dart';

import '../../../../Component/colors/colors.dart';
import '../../../../Component/navigator.dart';
import '../../more_places/view.dart';
import '../controller/controller.dart';
import '../controller/states.dart';
import 'one_place.dart';

class AttractionsWidget extends StatelessWidget {
  final String placeType;

  const AttractionsWidget({
    super.key,
    required this.placeType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: placeType,
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          textColor: AppColors.darkBlue,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 185.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: 4,
            itemBuilder: (context, index) => OnePlaceMakeYourPlanWidget(
              detailsModel:
                  MakeYourPlanController.get(context).attractions!.data![index],
            ),
          ),
        ),
        ViewMoreButtonWidget(
          onTap: () {
            /////////////////////////////// making the DetailsModelsssssssssss in the appController
            AppController.get(context).detailsModels =
                MakeYourPlanController.get(context).attractions!.data;
            //////////////////////////////
            defaultNavigator(
              context,
              MorePlacesScreen(
                placeType: "Attractions",
                places: MakeYourPlanController.get(context).attractions!.data!,
              ),
            );
          },
        ),
      ],
    );
  }
}

class HotelsWidget extends StatelessWidget {
  final String placeType;

  const HotelsWidget({
    super.key,
    required this.placeType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: placeType,
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          textColor: AppColors.darkBlue,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 185.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: 4,
            itemBuilder: (context, index) => OnePlaceMakeYourPlanWidget(
                detailsModel:
                    MakeYourPlanController.get(context).hotels!.data![index]),
          ),
        ),
        ViewMoreButtonWidget(
          onTap: () {
            /////////////////////////////// making the DetailsModelsssssssssss in the appController
            AppController.get(context).detailsModels =
                MakeYourPlanController.get(context).hotels!.data;
            //////////////////////////////
            defaultNavigator(
                context,
                MorePlacesScreen(
                  placeType: "Hotels",
                  places: MakeYourPlanController.get(context).hotels!.data!,
                ));
          },
        ),
      ],
    );
  }
}

class RestaurantsWidget extends StatelessWidget {
  final String placeType;

  const RestaurantsWidget({
    super.key,
    required this.placeType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultText(
          text: placeType,
          fontSize: 25.sp,
          fontWeight: FontWeight.w600,
          textColor: AppColors.darkBlue,
        ),
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
          height: 185.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(width: 20),
            itemCount: 4,
            itemBuilder: (context, index) => OnePlaceMakeYourPlanWidget(
              detailsModel:
                  MakeYourPlanController.get(context).restaurant!.data![index],
            ),
          ),
        ),
        ViewMoreButtonWidget(
          onTap: () {
            /////////////////////////////// making the DetailsModelsssssssssss in the appController
            AppController.get(context).detailsModels =
                MakeYourPlanController.get(context).restaurant!.data;
            //////////////////////////////
            defaultNavigator(
                context,
                MorePlacesScreen(
                  placeType: "Restaurants",
                  places: MakeYourPlanController.get(context).restaurant!.data!,
                ));
          },
        ),
      ],
    );
  }
}

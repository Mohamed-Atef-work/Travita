import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/screens/Details/view.dart';
import 'package:travita/screens/show_AI_plan/controller/controller.dart';
import 'package:travita/screens/show_AI_plan/controller/states.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/defaultText.dart';
import '../../../core/app_controller/appController.dart';

class RestaurantsModelSheetWidget extends StatelessWidget {
  final int placeId;

  const RestaurantsModelSheetWidget({super.key, required this.placeId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowAIPlanController>(
      create: (context) => ShowAIPlanController()
        ..getNearestRestaurants(
          placeId: placeId,
        ),
      child: BlocConsumer<ShowAIPlanController, ShowAIPlanStates>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetNearestRestaurantsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetNearestRestaurantsSuccess) {
            return SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                itemCount: ShowAIPlanController.get(context)
                    .restaurantsModel
                    .restaurants
                    .length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          AppController.get(context).detailsModels =
                              ShowAIPlanController.get(context)
                                  .restaurantsModel
                                  .restaurants;
                          AppController.get(context).detailsModel =
                              ShowAIPlanController.get(context)
                                  .restaurantsModel
                                  .restaurants[index];
                          defaultNavigator(context, const DetailsScreen());
                        },
                        icon: ShowAIPlanController.get(context)
                                    .restaurantsModel
                                    .restaurants[index]
                                    .image !=
                                null
                            ? Image.network(
                                ShowAIPlanController.get(context)
                                    .restaurantsModel
                                    .restaurants[index]
                                    .image!,
                                fit: BoxFit.cover,
                                width: 120.h,
                                height: 100.h,
                              )
                            : Image.network(
                                "https://i.pinimg.com/originals/49/e5/8d/49e58d5922019b8ec4642a2e2b9291c2.png",
                                fit: BoxFit.cover,
                                width: 120.h,
                                height: 100.h,
                              ),
                        label: SizedBox(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DefaultText(
                                text: ShowAIPlanController.get(context)
                                    .restaurantsModel
                                    .restaurants[index]
                                    .name,
                                fontWeight: FontWeight.w600,
                                fontSize: 18.sp,
                                textColor: AppColors.darkBlue,
                              ),
                              Rate(
                                allowHalf: false,
                                initialValue: ShowAIPlanController.get(context)
                                        .restaurantsModel
                                        .restaurants[index]
                                        .rating
                                        ?.toDouble() ??
                                    0,
                                color: AppColors.darkOrange,
                              )
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        thickness: .5,
                        color: AppColors.darkBlue,
                        height: 0,
                        endIndent: 30.w,
                        indent: 30.w,
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: DefaultText(
                text: "Oops !",
                fontSize: 30.sp,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        },
      ),
    );
  }
}

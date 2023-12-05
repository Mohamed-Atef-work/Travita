import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/make_your_plan_screens/more_places/controller/controller.dart';
import 'package:travita/screens/make_your_plan_screens/show_manually_plan/widgets/place_manual.dart';

import '../../../Component/widgets/category/category_of_type_the_favourit.dart';
import '../more_places/controller/states.dart';
import '../show_all_manually_plans/widgets/trip.dart';
import 'controller/controller.dart';
import 'controller/states.dart';

class ShowManuallyPlan extends StatelessWidget {
  late final int tripId;

  ShowManuallyPlan({required this.tripId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShowManualPlanController>(
      create: (context) => ShowManualPlanController()
        ..getTripPlaces(
          tripId: tripId,
        ),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Image.asset(
            "image/appBarLogo.png",
            width: 100.w,
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0.r),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DefaultText(
                text: 'Your Trip',
                textColor: AppColors.darkBlue,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<ShowManualPlanController, ShowTripStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetTripSuccess) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 0,
                          thickness: .8,
                          indent: 20.w,
                          endIndent: 20.w,
                          color: AppColors.darkGrey,
                        ),
                        itemCount: ShowManualPlanController.get(context)
                            .places
                            .data
                            .allFavorites
                            .length,
                        itemBuilder: (context, index) => PlaceManualWidget(
                            place: ShowManualPlanController.get(context)
                                .places
                                .data
                                .allFavorites[index]),
                      ),
                    );
                  } else if (state is GetTripError) {
                    return Expanded(
                        child: Center(
                      child: DefaultText(text: "Oops !"),
                    ));
                  } else {
                    return const Expanded(
                        child: Center(
                      child: CircularProgressIndicator(),
                    ));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
//Expanded(
//                         child: Center(
//                       child: CircularProgressIndicator(),
//                     ))
/////////////////////////
//Expanded(
//                         child: Center(
//                       child: DefaultText(text: "Oops !"),
//                     ))

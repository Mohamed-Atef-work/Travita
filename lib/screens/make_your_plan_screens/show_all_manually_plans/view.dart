import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigator.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/make_your_plan_screens/show_all_manually_plans/widgets/trip.dart';

import '../more_places/controller/controller.dart';
import '../more_places/controller/states.dart';
import '../show_manually_plan/view.dart';

class ShowAllManualPlansScreen extends StatelessWidget {
  const ShowAllManualPlansScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MorePlacesController()..getAllTrips(),
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
                text: 'Your Trips',
                textColor: AppColors.darkBlue,
                fontSize: 32.sp,
                fontWeight: FontWeight.w700,
              ),
              SizedBox(
                height: 20.h,
              ),
              BlocConsumer<MorePlacesController, MorePlaces>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is GetTripsSuccess) {
                    return Expanded(
                      child: ListView.separated(
                        separatorBuilder: (context, index) => Divider(
                          height: 0,
                          thickness: .8,
                          indent: 20.w,
                          endIndent: 20.w,
                          color: AppColors.darkGrey,
                        ),
                        itemCount: MorePlacesController.get(context)
                            .tripsModel!
                            .trips.length,
                        itemBuilder: (context, index) => OneManuallyPlanWidget(
                          trip: MorePlacesController.get(context)
                              .tripsModel!
                              .trips[index],
                        ),
                      ),
                    );
                  } else if (state is GetTripsError) {
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

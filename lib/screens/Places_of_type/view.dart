import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/Places_of_type/cubit/controller.dart';
import 'package:travita/screens/Places_of_type/cubit/states.dart';
import 'package:travita/screens/Places_of_type/widgets/subTypes.dart';

import '../../Component/colors/colors.dart';

class PlacesOfTypeScreen extends StatelessWidget {
  late final String category;

  PlacesOfTypeScreen({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlacesOfTypeController>(
      create: (context) => PlacesOfTypeController()
        ..getAllPlaces(
          endpoint: category.toLowerCase(),
        ),
      child: Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Image.asset(
            "image/appBarLogo.png",
            width: 100,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 20.h,
                left: 10.w,
              ),
              child: Text(
                category,
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (category == "Attractions")
              BlocConsumer<PlacesOfTypeController, PlacesOfTypeStates>(
                listener: (context, state) {
                  if (state is PlacesOfTypeInitialState) {
                    PlacesOfTypeController.get(context).isInitial = true;
                  } else {
                    PlacesOfTypeController.get(context).isInitial = false;
                  }
                },
                builder: (context, state) => Padding(
                  padding: EdgeInsets.only(
                    left: 8.w,
                    bottom: 8.h,
                    top: 8.h,
                  ),
                  child: SizedBox(
                    height: 40.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => SubType(
                        surveyCategoriesText:
                            PlacesOfTypeController.get(context).subTypes[index],
                        onTap: () {
                          PlacesOfTypeController.get(context).changeSubType(
                            index: index,
                            category: category.toLowerCase(),
                          );
                        },
                        iconAndTextColor:
                            PlacesOfTypeController.get(context).subTpeIndex ==
                                    index
                                ? AppColors.white
                                : AppColors.black,
                        oneCategoryOfSurveyColor:
                            PlacesOfTypeController.get(context).subTpeIndex ==
                                    index
                                ? AppColors.darkOrange
                                : AppColors.ofWhite,
                      ),
                      separatorBuilder: (context, index) => SizedBox(
                        width: 5.w,
                      ),
                      itemCount:
                          PlacesOfTypeController.get(context).subTypes.length,
                    ),
                  ),
                ),
              ),
            if (category == "Attractions")
              BlocConsumer<PlacesOfTypeController, PlacesOfTypeStates>(
                builder: (context, state) {
                  return state is PlacesOfTypeGetDataLoadingState &&
                          PlacesOfTypeController.get(context).isInitial == false
                      ? const LinearProgressIndicator()
                      : const SizedBox.shrink();
                },
                listener: (context, state) {},
              ),
            Expanded(
              child: BlocConsumer<PlacesOfTypeController, PlacesOfTypeStates>(
                buildWhen: (previousState, currentState) =>
                    currentState is PlacesOfTypeGetDataSuccessState,
                listener: (context, state) {},
                builder: (context, state) {
                  return state is PlacesOfTypeGetDataSuccessState
                      ? Padding(
                          padding: EdgeInsets.all(20.r),
                          child:
                              PlacesOfTypeController.get(context).buildItems(),
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

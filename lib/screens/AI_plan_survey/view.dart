import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/navigate_and_finish.dart';
import 'package:travita/Component/widgets/button/DefaultOutlindedButton.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/screens/AI_plan_survey/Widget/location_button.dart';
import 'package:travita/screens/AI_plan_survey/controller/states.dart';

import '../google_map/view_Determine_startPosition.dart';
import '../show_AI_plan/view.dart';
import 'Widget/form.dart';
import 'controller/controller.dart';

class AIPlanSurveyScreen extends StatelessWidget {
  const AIPlanSurveyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AIPlanSurveyController>(
      create: (context) => AIPlanSurveyController(),
      child: BlocConsumer<AIPlanSurveyController, AIPlanSurveyStates>(
        buildWhen: (previousState, currentState) =>
            ////////////////////////////
            currentState is NoTValidFormField ||
            currentState is DetermineStatePosition ||
            currentState is AIPlanInitial,
        ////////////////////////
        listener: (context, state) {
          if (state is CreateAIPlanLoading) {
            navigateAndFinish(context: context, newScreen: ShowAIPlanScreen());
          }
        },
        builder: (context, state) {
          if (state is DetermineStatePosition) {
            return const DetermineTheStartPositionScreen();
          } else {
            return Scaffold(
              appBar: AppBar(
                /*leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),*/
                titleSpacing: 0,
                title: Image.asset(
                  "image/appBarLogo.png",
                  width: 100.w,
                ),
              ),
              body: Padding(
                padding: EdgeInsets.only(
                  left: 32.r,
                  right: 32.r,
                  top: 10.r,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: DefaultText(
                          text: "Survey",
                          fontSize: 25.sp,
                          fontWeight: FontWeight.w700,
                          textColor: AppColors.darkBlue,
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: DefaultText(
                          text:
                              " Please, fill in these required information to get the plan that best suits you.",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w300,
                          textColor: AppColors.darkGrey,
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      AIPlanSurveyFormWidget(),
                      LocationButtonWidget(
                        width: 180.w,
                        height: 60.h,
                        icon: Icons.location_pin,
                        text: "Location",
                        fontSize: 25.sp,
                        onPressed: () {
                          AIPlanSurveyController.get(context)
                              .determineStartPosition();
                          /*defaultNavigator(
                          context, const DetermineTheStartPosition());*/
                        },
                        backgroundColor: AppColors.white,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: state is CreateAIPlanLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : DefaultOutlinedButton(
                                onPressed: () {
                                  AIPlanSurveyController.get(context)
                                      .createAiPlan(
                                    latitude:
                                        AIPlanSurveyController.get(context)
                                            .latitude,
                                    longitude:
                                        AIPlanSurveyController.get(context)
                                            .longitude,
                                    context: context,
                                  ); //print("object");
                                  //defaultNavigator(context, const FinalPlanScreen());
                                },
                                width: 120.w,
                                height: 50.h,
                                backgroundColor: AppColors.darkOrange,
                                text: "Done",
                                textColor: AppColors.white,
                                borderRadius: 10,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}

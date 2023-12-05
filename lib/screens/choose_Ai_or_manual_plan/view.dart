import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Component/colors/colors.dart';
import '../../Component/navigator.dart';
import '../../Component/widgets/defaultText.dart';
import '../AI_plan_survey/view.dart';
import '../make_your_plan_screens/make_your_plan/view.dart';
import 'widgets/onePlanWidget.dart';
import 'widgets/aiOrManualPlanWidget.dart';

class ChooseAiOrManualPlanScreen extends StatelessWidget {
  const ChooseAiOrManualPlanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 15.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "image/plan.png",
                    width: double.infinity,
                    height: 186.h,
                    fit: BoxFit.cover,
                  ),
                  DefaultText(
                    text: "Get a convenient\n travel plan",
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.white,
                  ),
                ],
              ),
              SizedBox(
                height: 33.h,
              ),
              DefaultText(
                text: "Highly recommended plan",
                textColor: AppColors.blue,
                fontWeight: FontWeight.w600,
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 24.h,
              ),
              SizedBox(
                height: 240.h,
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => const OnePlanWidget(),
                  separatorBuilder: (context, index) => SizedBox(
                    width: 20.w,
                  ),
                  itemCount: 4,
                ),
              ),
              SizedBox(
                height: 14.h,
              ),
              AiOrManualPlan(
                firstText: "Ai Plan",
                secondText:
                    "To get the best travel plan according to your interests",
                containerWidth: double.infinity,
                containerHeight: 163.h,
                buttonText: "Go",
                buttonWidth: 244.w,
                buttonHeight: 46.h,
                onPressed: () {
                  defaultNavigator(context, const AIPlanSurveyScreen());
                },
              ),
              SizedBox(
                height: 16.h,
              ),
              AiOrManualPlan(
                firstText: "Create your own plan",
                secondText: "Make your own trip plan",
                containerWidth: double.infinity,
                containerHeight: 163.h,
                buttonText: "Go",
                buttonWidth: 244.w,
                buttonHeight: 46.h,
                onPressed: () {
                  defaultNavigator(context, const MakeYourPlanScreen());
                },
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

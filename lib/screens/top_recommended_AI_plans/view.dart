import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Component/colors/colors.dart';
import '../../Component/widgets/defaultText.dart';
import '../choose_Ai_or_manual_plan/widgets/onePlanWidget.dart';
import '../layOut/cubit/controller.dart';

class RecommendedAIPlansScreen extends StatefulWidget {
  const RecommendedAIPlansScreen({Key? key}) : super(key: key);

  @override
  State<RecommendedAIPlansScreen> createState() =>
      _RecommendedAIPlansScreenState();
}

class _RecommendedAIPlansScreenState extends State<RecommendedAIPlansScreen> {
  var controller = LayOutController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("image/appBarLogo.png"),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 24.h,
          left: 32.w,
          right: 32.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultText(
              text: "Hi !",
              textColor: AppColors.blue,
              fontSize: 32.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: 8.h,
            ),
            DefaultText(
              text:
                  "Based on your interests and budget, we offer you these plans, knowing that you can modify them",
              fontWeight: FontWeight.w300,
              fontSize: 16.sp,
            ),
            SizedBox(
              height: 24.h,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 2.w / 2.6.h,
                ),
                itemBuilder: (BuildContext context, int index) =>
                    OnePlanWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

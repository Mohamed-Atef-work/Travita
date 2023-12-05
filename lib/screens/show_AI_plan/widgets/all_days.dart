import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/show_AI_plan/models/model.dart';

import '../../../Component/colors/colors.dart';
import '../../../Component/widgets/defaultText.dart';
import 'all_places.dart';

class AllDaysAIPlanWidget extends StatelessWidget {
  final ShowAIPlanModel aIPlan;

  const AllDaysAIPlanWidget({
    super.key,
    required this.aIPlan,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        aIPlan.days.length,
        (index) => AllPlacesOneDayWidget(
          dayIndex: index,
          day: aIPlan.days[index],
        ),
      ),
    );
  }
}

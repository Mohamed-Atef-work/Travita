import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';

import '../../../../../Component/widgets/defaultText.dart';
import '../../controller/controller.dart';

class CheckBoxItemWidget extends StatelessWidget {
  final int index;

  const CheckBoxItemWidget({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CheckboxListTile(
          value: MorePlacesController.get(context).isCheckedItems![index],
          onChanged: (bool? newValue) {
            MorePlacesController.get(context)
                .chooseTripToPutPlace(index: index);
          },
          activeColor: AppColors.darkBlue,
          checkColor: AppColors.white,
          side: MaterialStateBorderSide.resolveWith(
            (states) => const BorderSide(
              width: 1.4,
              color: AppColors.darkBlue,
            ),
          ),
          secondary: Image.asset(
            "image/plan.png",
            width: 40.w,
            height: 50.h,
          ),
          title: DefaultText(
            text:
                MorePlacesController.get(context).tripsModel!.trips[index].name,
            textColor: AppColors.darkBlue,
            fontWeight: FontWeight.bold,
            textAlign: TextAlign.start,
          ),
          /*subtitle: DefaultText(
            text: '3 Saved',
            textColor: AppColors.darkBlue,
            textAlign: TextAlign.start,
          ),*/
        ),
        const Divider(
          height: 0,
          thickness: .8,
          indent: 20,
          endIndent: 20,
          color: AppColors.darkGrey,
        ),
      ],
    );
    ;
  }
}

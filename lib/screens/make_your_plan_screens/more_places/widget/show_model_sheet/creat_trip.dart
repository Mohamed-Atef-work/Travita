import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/textFrmField/simple%20textFiels.dart';

import '../../../../../Component/colors/colors.dart';
import '../../../../../Component/widgets/button/default_button.dart';
import '../../../../../Component/widgets/defaultText.dart';
import '../../controller/controller.dart';

class CreateTripWidget extends StatelessWidget {
  const CreateTripWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2,
      child: Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Form(
          key: MorePlacesController.get(context).createTripFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: SimpleTextFormFiled(
                  borderColor: MorePlacesController.get(context).borderColor,
                  icon: null,
                  type: "Name the trip",
                  controller:
                      MorePlacesController.get(context).createTripController,
                  validate: (value) {
                    if (value!.isEmpty) {
                      MorePlacesController.get(context)
                          .noTripNameFound(context);
                      return null;
                    }
                    return null;
                  },
                ),
              ),
              /*LocationButton(
                icon: null,
                text: "Create a trip",
                width: 170.w,
                height: 60.h,
                fontSize: 20.sp,
              ),*/
              DefaultButton(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
                borderRadius: 10.r,
                opacity: 1,
                onPressed: () {
                  MorePlacesController.get(context).createTrip(context);
                },
                width: 200.w,
                height: 60.h,
                backgroundColor: AppColors.darkOrange,
                text: "Create a Trip",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

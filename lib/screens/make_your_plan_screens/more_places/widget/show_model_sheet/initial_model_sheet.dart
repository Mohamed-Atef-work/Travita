import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/button/DefaultOutlindedButton.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';

import '../../../../../Component/colors/colors.dart';
import '../../../../../Component/widgets/button/default_button.dart';
import '../../../../../Component/widgets/defaultText.dart';
import '../../controller/controller.dart';
import 'check_box_item.dart';

class InitialModelSheetWidget extends StatelessWidget {
  final DetailsModel placeDetails;
  const InitialModelSheetWidget({Key? key, required this.placeDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:
                  MorePlacesController.get(context).tripsModel!.trips.length,
              itemBuilder: (context, index) => CheckBoxItemWidget(
                index: index,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {
                  MorePlacesController.get(context).goCreatePlan();
                  /*showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return const CreateTripFormFieldWidget();
                    },
                  );*/
                },
                child: DefaultText(
                  text: "Create a trip",
                  textColor: AppColors.darkOrange,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
              DefaultOutlinedButton(
                onPressed: () {
                  MorePlacesController.get(context)
                      .putPlaceInMoreThanOneTrip(
                        placeType: placeDetails.favoriteType!,
                        placeId: placeDetails.id!,
                      )
                      .then((value) {});
                },
                width: 100.w,
                height: 36.h,
                backgroundColor: AppColors.darkBlue,
                text: "Done",
                textColor: AppColors.white,
                fontSize: 18.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

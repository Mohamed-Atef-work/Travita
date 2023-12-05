import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/Component/widgets/defaultText.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/screens/AI_plan_survey/Widget/location_button.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';
import 'package:travita/screens/show_AI_plan/models/nearest_restaurants_model.dart';
import 'package:travita/screens/show_AI_plan/widgets/restaurant_model_sheet.dart';

class PlaceAIPlanWidget extends StatelessWidget {
  final DetailsModel place;
  final Function() onTap;

  const PlaceAIPlanWidget(
      {super.key, required this.place, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: onTap,
          icon: Image.network(
            place.image!,
            width: 179.w,
            height: 167.h,
            fit: BoxFit.cover,
          ),
          label: SizedBox(
            height: 166.h,
            //width: 180.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DefaultText(
                  text: place.name,
                  fontWeight: FontWeight.w600,
                  fontSize: 16.sp,
                  textColor: AppColors.darkBlue,
                ),
                DefaultText(
                  text: place.description ?? place.address ?? "Unknown",
                  fontWeight: FontWeight.w300,
                  fontSize: 12.sp,
                  textColor: AppColors.grey,
                  textAlign: TextAlign.left,
                  maxLines: 6,
                  textOverflow: TextOverflow.ellipsis,
                ),
                Rate(
                  color: AppColors.darkOrange,
                  initialValue: place.rating!.toDouble(),
                  readOnly: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("object");
                      },
                      child: const Icon(
                        Icons.edit_outlined,
                        color: Colors.green,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.delete,
                          color: AppColors.darkOrange,
                        ))
                    //  IconButton(onPressed: (){}, icon: Icon(Icons.find_replace,color: AppColors.darkOrange,)),
                    // // SizedBox(width: 20.w,),
                    //  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: AppColors.darkOrange,)),
                  ],
                ),
              ],
            ),
          ),
        ),
        LocationButtonWidget(
          width: 200.w,
          height: 32.h,
          icon: Icons.restaurant,
          text: "Nearest restaurant",
          fontSize: 16.sp,
          //color: AppColors.ofWhite,
          onPressed: () {
            showModalBottomSheet<void>(
              context: context,
              builder: (BuildContext context) =>
                  RestaurantsModelSheetWidget(placeId: place.id!),
            );
          },
          backgroundColor: AppColors.ofWhite,
        ),
        const Divider(
          color: AppColors.darkBlue,
          thickness: .5,
          indent: 70,
          endIndent: 70,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rate/rate.dart';
import 'package:travita/screens/Places_of_type/Models/restaurantsModel.dart';

import '../../../../Component/colors/colors.dart';
import '../../../../Component/widgets/defaultText.dart';

class PlaceManualWidget extends StatelessWidget {
  late final DetailsModel place;
  PlaceManualWidget({
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: () {},
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
    );
  }
}

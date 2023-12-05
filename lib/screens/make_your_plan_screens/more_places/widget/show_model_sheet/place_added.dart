import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/widgets/defaultText.dart';

class PlaceAddedWidget extends StatelessWidget {
  const PlaceAddedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Center(
        child: DefaultText(
          text: "Added !",
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Component/widgets/defaultText.dart';

class ModelSheetErrorWidget extends StatelessWidget {
  const ModelSheetErrorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2.5,
      child: Center(
        child: DefaultText(
          text: "Oops !",
          fontSize: 30.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

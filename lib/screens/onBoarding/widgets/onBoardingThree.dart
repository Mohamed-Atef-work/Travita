import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'body.dart';
import 'image.dart';

class OnBoardingThree extends StatelessWidget {
  const OnBoardingThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: ListView(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 360.h,
                  ),
                  OnBoardingBody(),
                ],
              ),
              const OnBoardingImage(),
            ],
          )
        ],
      ),
    );
  }
}

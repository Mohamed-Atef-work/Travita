import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/REGISTERATION/LogIN/controller.dart';

import '../../../Component/colors/colors.dart';
import 'widgets/form.dart';
import 'widgets/image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginController>(
      create: (context) => LoginController(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          toolbarHeight: 0,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  const LoginImage(),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 40.h + 300.h - 100.h,
                      ),
                      LoginFormWithCurve(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

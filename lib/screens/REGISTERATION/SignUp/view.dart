import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travita/core/app_controller/appStates.dart';
import '../../../Component/colors/colors.dart';
import 'controller.dart';
import 'widgets/form.dart';
import 'widgets/image.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpController(),
      child: BlocConsumer<SignUpController, AppStates>(
        buildWhen: (previousState, currentState) => false,
        listener: (context, state) {},
        builder: (context, state) => Scaffold(
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
                    const SignUpImage(),
                    Column(
                      //mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: SignUpController.get(context).gapInImage,
                        ),
                        SignUpFormWithCurve(),
                      ],
                    ),
                  ],
                ),
                //ImageCurveForm(),
                //SignUpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/navigate_and_finish.dart';
import 'package:travita/screens/survey/view.dart';
import '../../../../Component/colors/colors.dart';
import '../../../../Component/navigator.dart';
import '../../../../Component/widgets/button/defaultTextButton.dart';
import '../../../../Component/widgets/button/registeration_button.dart';
import '../../../../Component/widgets/textFrmField/dfaultTextFormField.dart';
import '../../../../core/app_controller/appController.dart';
import '../../../../core/app_controller/appStates.dart';
import '../../../layOut/view.dart';
import '../../LogIN/view.dart';
import '../../widgets/accountsIcons.dart';
import '../controller.dart';
import 'curve.dart';

class SignUpFormWithCurve extends StatelessWidget {
  SignUpFormWithCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpController, AppStates>(
      buildWhen: (previousState, currentState) =>
          currentState is NotValidState || currentState is RegisterLoadingState,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          AppController.get(context).getFavorite();
          navigateAndFinish(context: context, newScreen: const SurveyScreen());
          //defaultNavigator(context, LayOutScreen());
        }
      },
      builder: (context, state) => SizedBox(
        height: SignUpController.get(context).formWithCurveHeight,
        child: Stack(
          children: [
            const SignUpCurve(),
            Form(
              key: SignUpController.get(context).formKey,
              child: Padding(
                padding: EdgeInsets.only(
                  right: 40.w,
                  left: 30.w,
                ),
                child: Column(
                  //mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SignUpController.get(context).gapInForm,
                    ),
                    Text(
                      "Sign UP ",
                      style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Hello , Please fill this form to create an account",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "First Name",
                              style: TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultFormField(
                              width: 141.w,
                              height:
                                  SignUpController.get(context).notValidNames[0]
                                      ? 41.h
                                      : 65.h,
                              controller: SignUpController.get(context)
                                  .firstNameController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  SignUpController.get(context)
                                      .notValidNames[0] = false;
                                  return "first Name";
                                }
                                SignUpController.get(context).notValidNames[0] =
                                    true;
                                return null;
                              },
                              hintText: "First name",
                              isPassword: false,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Last Name",
                              style: TextStyle(
                                color: AppColors.grey,
                              ),
                            ),
                            SizedBox(
                              height: 8.h,
                            ),
                            DefaultFormField(
                              width: 192.w,
                              height:
                                  SignUpController.get(context).notValidNames[1]
                                      ? 41.h
                                      : 65.h,
                              controller: SignUpController.get(context)
                                  .lastNameController,
                              type: TextInputType.text,
                              validate: (value) {
                                if (value!.isEmpty) {
                                  SignUpController.get(context)
                                      .notValidNames[1] = false;
                                  return "please enter your last Name";
                                }
                                SignUpController.get(context).notValidNames[1] =
                                    true;
                                return null;
                              },
                              hintText: "Last Name",
                              isPassword: false,
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Email address',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DefaultFormField(
                      width: double.infinity,
                      height: SignUpController.get(context).notValidFields[0]
                          ? 41.h
                          : 65.h,
                      controller: SignUpController.get(context).emailController,
                      type: TextInputType.text,
                      validate: (value) {
                        if (value!.isEmpty) {
                          SignUpController.get(context).notValidFields[0] =
                              false;
                          return "please enter your email";
                        } else if (!SignUpController.get(context).isValidEmail(
                            email: SignUpController.get(context)
                                .emailController
                                .text)) {
                          SignUpController.get(context).notValidFields[0] =
                              false;
                          return "Invalid Email";
                        }
                        SignUpController.get(context).notValidFields[0] = true;
                        return null;
                      },
                      hintText: "Email Address",
                      //prefix: null,
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Create password',
                      style: TextStyle(
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BlocConsumer<SignUpController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is ChangVisibilityState,
                      listener: (context, state) {},
                      builder: (context, state) => DefaultFormField(
                        hintText: "Password",
                        width: double.infinity,
                        height: SignUpController.get(context).notValidFields[1]
                            ? 49.h
                            : 70.h,
                        controller:
                            SignUpController.get(context).passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            SignUpController.get(context).notValidFields[1] =
                                false;
                            return "please enter your password";
                          } else if (SignUpController.get(context)
                                  .isValidPassword(
                                      password: SignUpController.get(context)
                                          .passwordController
                                          .text) ==
                              false) {
                            SignUpController.get(context).notValidFields[1] =
                                false;
                            return "invalid password";
                          }
                          SignUpController.get(context).notValidFields[1] =
                              true;
                          return null;
                        },
                        isPassword: true,
                        obSecure: SignUpController.get(context).isSecured,
                        suffix: state is RegisterLoadingState
                            ? null
                            : SignUpController.get(context).isSecured
                                ? Icons.remove_red_eye
                                : Icons.visibility_off_outlined,
                        suffixButtonPressed: () {
                          SignUpController.get(context)
                              .changePasswordVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const Text(
                      'Confirm Password',
                      style: TextStyle(color: AppColors.grey),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BlocConsumer<SignUpController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is ChangVisibilityState,
                      listener: (context, state) {},
                      builder: (context, state) => DefaultFormField(
                        hintText: "password",
                        width: double.infinity,
                        height: SignUpController.get(context).notValidFields[2]
                            ? 49.h
                            : 70.h,
                        controller: SignUpController.get(context)
                            .confirmPasswordController,
                        type: TextInputType.visiblePassword,
                        validate: (value) {
                          if (value!.isEmpty) {
                            SignUpController.get(context).notValidFields[2] =
                                false;
                            return "please enter your password";
                          } else if (SignUpController.get(context)
                                  .passwordController
                                  .text !=
                              SignUpController.get(context)
                                  .confirmPasswordController
                                  .text) {
                            SignUpController.get(context).notValidFields[2] =
                                false;
                            return "passwords are not identical";
                          }
                          SignUpController.get(context).notValidFields[2] =
                              true;
                          return null;
                        },
                        isPassword: true,
                        obSecure:
                            SignUpController.get(context).isSecuredConfirm,
                        suffix: SignUpController.get(context).isSecuredConfirm
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        suffixButtonPressed: () {
                          SignUpController.get(context)
                              .changeSignUpConfirmVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    BlocConsumer<SignUpController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is! ChangVisibilityState,
                      listener: (context, state) {},
                      builder: (context, state) => Align(
                        alignment: Alignment.center,
                        child: state is RegisterLoadingState ||
                                state is LoginLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : GestureDetector(
                                onTap: () {
                                  if (SignUpController.get(context)
                                      .formKey
                                      .currentState!
                                      .validate()) {
                                    SignUpController.get(context).reset();
                                    SignUpController.get(context).signUp(
                                      context: context,
                                    );
                                  } else {
                                    SignUpController.get(context)
                                        .formFieldIsNotValid();
                                    print("Not Valid");
                                  }
                                },
                                child: RegisterationButton(
                                  name: "Sign Up",
                                  fontSize: 25.sp,
                                  height: 45.h,
                                  width: 245.w,
                                ),
                              ),
                      ),
                    ),
                    const Spacer(),
                    AccountsIcons(
                      connect: "sign up",
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          " Don’t have an account?  ",
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                        DefaultTextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const LoginScreen()),
                            );
                          },
                          text: "Log In",
                          textColor: AppColors.darkOrange,
                          fontSize: 14.sp,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

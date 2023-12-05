import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/screens/REGISTERATION/LogIN/controller.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/core/app_controller/appStates.dart';
import '../../../../Component/colors/colors.dart';
import '../../../../Component/navigator.dart';
import '../../../../Component/widgets/button/defaultTextButton.dart';
import '../../../../Component/widgets/button/registeration_button.dart';
import '../../../../Component/widgets/textFrmField/dfaultTextFormField.dart';
import '../../../layOut/view.dart';
import '../../SignUp/view.dart';
import '../../widgets/accountsIcons.dart';
import 'curve.dart';

class LoginFormWithCurve extends StatelessWidget {
  LoginFormWithCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginController, AppStates>(
      buildWhen: (previousState, currentState) =>
          currentState is! ChangVisibilityState &&
          currentState is! LoginSuccessState,
      listener: (context, state) {
        if (state is LoginSuccessState) {
          AppController.get(context).getFavorite();
          defaultNavigator(context, LayOutScreen());
        }
      },
      builder: (context, state) => SizedBox(
        height: 660.h,
        child: Stack(
          children: [
            const LoginCurve(),
            Form(
              key: LoginController.get(context).formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 35.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 110.h,
                    ),
                    Text(
                      "Log In ",
                      style: TextStyle(
                        fontSize: 40.sp,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      "Welcome back .Enter your credentials to access your account",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    Spacer(),
                    Text(
                      "Please enter your Username or Email address",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    DefaultFormField(
                      width: double.infinity,
                      height: LoginController.get(context).validFormFields[0]
                          ? 51.h
                          : 70.h,
                      controller: LoginController.get(context).emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value!.isEmpty) {
                          LoginController.get(context).validFormFields[0] =
                              false;
                          return "please enter your Email";
                        } else if (!LoginController.get(context).isValidEmail(
                            email: LoginController.get(context)
                                .emailController
                                .text)) {
                          LoginController.get(context).validFormFields[0] =
                              false;
                          return "Invalid Email";
                        }
                        LoginController.get(context).validFormFields[0] = true;
                        return null;
                      },
                      hintText: "Email Address",
                      isPassword: false,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    Text(
                      " Please enter your password",
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    BlocConsumer<LoginController, AppStates>(
                      buildWhen: (previousState, currentState) =>
                          currentState is ChangVisibilityState,
                      listener: (context, state) {},
                      builder: (context, state) => DefaultFormField(
                        hintText: "Password",
                        isPassword: true,
                        width: double.infinity,
                        obSecure: LoginController.get(context).obSecure,
                        type: TextInputType.visiblePassword,
                        controller:
                            LoginController.get(context).passwordController,
                        height: LoginController.get(context).validFormFields[1]
                            ? 51.h
                            : 70.h,
                        validate: (value) {
                          if (value!.isEmpty) {
                            LoginController.get(context).validFormFields[1] =
                                false;
                            return "please enter your Password";
                          } else if (!LoginController.get(context)
                              .isValidPassword(
                            password: LoginController.get(context)
                                .passwordController
                                .text,
                          )) {
                            LoginController.get(context).validFormFields[1] =
                                false;
                            return "Invalid Password";
                          }
                          LoginController.get(context).validFormFields[1] =
                              true;
                          return null;
                        },
                        suffix: LoginController.get(context).obSecure
                            ? Icons.remove_red_eye
                            : Icons.visibility_off_outlined,
                        suffixButtonPressed: () {
                          LoginController.get(context)
                              .changePasswordVisibility();
                        },
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: DefaultTextButton(
                        text: "Forget Password",
                        onPressed: () {},
                        textColor: AppColors.grey,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: state is LoginLoadingState
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : GestureDetector(
                              onTap: () {
                                if (LoginController.get(context)
                                    .formKey
                                    .currentState!
                                    .validate()) {
                                  LoginController.get(context).logIn(
                                    password: LoginController.get(context)
                                        .passwordController
                                        .text,
                                    email: LoginController.get(context)
                                        .emailController
                                        .text,
                                  );
                                } else {
                                  LoginController.get(context)
                                      .formFieldIsNotValid();
                                }
                              },
                              child: RegisterationButton(
                                name: "Log In",
                                width: 245.w,
                                height: 45.h,
                                fontSize: 25.sp,
                              ),
                            ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    AccountsIcons(
                      connect: "log in",
                      onPressed: () {
                        if (state is! RegisterLoadingState &&
                            state is! LoginLoadingState) {
                          LoginController.get(context).googleLogin(
                            context: context,
                          );
                        }
                      },
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
                          text: "Sign Up",
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpScreen()),
                            );
                          },
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

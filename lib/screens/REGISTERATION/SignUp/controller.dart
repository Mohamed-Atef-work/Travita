import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/core/app_constants/constants.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/core/app_controller/appStates.dart';
import 'package:travita/core/database/remote/dioHelper/dioHelper.dart';
import 'package:travita/core/database/remote/dioHelper/endpoints.dart';

import '../../../Component/navigator.dart';
import '../../layOut/view.dart';
import '../model.dart';

class SignUpController extends AppController {
  static SignUpController get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> formKey = GlobalKey();

  late final TextEditingController usernameController = TextEditingController();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();
  late final TextEditingController confirmPasswordController =
      TextEditingController();
  late final TextEditingController firstNameController =
      TextEditingController();
  late final TextEditingController lastNameController = TextEditingController();

  late bool isSecured = false;
  late bool isSecuredConfirm = false;
  void changeSignUpConfirmVisibility() {
    isSecuredConfirm = !isSecuredConfirm;
    super.changePasswordVisibility();
  }

  @override
  void changePasswordVisibility() {
    isSecured = !isSecured;
    super.changePasswordVisibility();
  }

  void signUp({required BuildContext context}) {
    emit(RegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      baseUrl: AppConstants.baseUrlAuth,
      data: {
        "username": "user-_name",
        "lname": lastNameController.text,
        "fname": firstNameController.text,
        "email": emailController.text,
        "password": passwordController.text,
        "password_confirmation": confirmPasswordController.text,
      },
    ).then((value) {
      //emit(RegisterSuccessState());
      logIn(
        email: emailController.text,
        password: passwordController.text,
      );
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
      return;
    });
  }

  late double formWithCurveHeight = 755.h;
  late double gapInForm = 130.h;
  late double gapInImage = 30.h + 235.h - 115.h;

  //late int numNotValid = 130.h;

  List<bool> notValidFields = [
    true,
    true,
    true,
  ];
  List<bool> notValidNames = [
    true,
    true,
  ];
  late int numberOfNotValid = 0;

  void countNotValid() {
    numberOfNotValid = 0;
    for (bool element in notValidFields) {
      if (!element) {
        numberOfNotValid++;
      }
    }
    for (bool element in notValidNames) {
      if (!element) {
        numberOfNotValid++;
        break;
      }
    }
    print(numberOfNotValid.toString());
  }

  @override
  void formFieldIsNotValid() {
    countNotValid();
    if (formWithCurveHeight != (755.h + (numberOfNotValid * 20).h)) {
      formWithCurveHeight = 755.h + (numberOfNotValid * 20).h;
      gapInForm = 130.h + (numberOfNotValid * 3).h;
      gapInImage = 30.h + 235.h - 115.h - (numberOfNotValid * 3.5).h;
    }
    print(formWithCurveHeight.toString());
    emit(NotValidState());
  }

  void reset() {
    formWithCurveHeight = 755.h;
    gapInForm = 130.h;
    gapInImage = 30.h + 235.h - 115.h;
  }
}

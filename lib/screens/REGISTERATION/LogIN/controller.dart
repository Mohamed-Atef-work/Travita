import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/app_controller/appController.dart';

class LoginController extends AppController {
  static LoginController get(context) => BlocProvider.of(context);

  late final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController emailController = TextEditingController();
  late final TextEditingController passwordController = TextEditingController();

  late List<bool> validFormFields = [
    true,
    true,
  ];

  late bool obSecure = false;

  @override
  void changePasswordVisibility() {
    obSecure = !obSecure;
    super.changePasswordVisibility();
  }
}

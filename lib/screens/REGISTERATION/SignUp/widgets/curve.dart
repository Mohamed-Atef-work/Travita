import 'package:flutter/cupertino.dart';
import '../../../../Component/widgets/loginSignUpCurve.dart';

class SignUpCurve extends StatelessWidget {
  const SignUpCurve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(
        double.infinity,
        double.infinity,
      ),
      painter: LoginSignupCurve(),
    );
  }
}

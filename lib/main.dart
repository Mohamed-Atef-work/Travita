import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travita/Component/colors/colors.dart';
import 'package:travita/screens/AI_plan_survey/view.dart';
import 'package:travita/screens/Profile/profile.dart';
import 'package:travita/screens/REGISTERATION/LogIN/view.dart';
import 'package:travita/screens/REGISTERATION/SignUp/view.dart';
import 'package:travita/screens/Search/SearcHTest.dart';
import 'package:travita/screens/Search/view_search.dart';
import 'package:travita/screens/Splash/splash.dart';
import 'package:travita/screens/layOut/view.dart';
import 'package:travita/screens/make_your_plan_screens/make_your_plan/view.dart';
import 'package:travita/core/app_controller/appController.dart';
import 'package:travita/core/app_controller/appStates.dart';
import 'package:travita/firebase_options.dart';
import 'package:travita/screens/make_your_plan_screens/show_all_manually_plans/view.dart';
import 'package:travita/screens/show_AI_plan/testAIPlan.dart';
import 'package:travita/screens/show_AI_plan/view.dart';
import 'package:travita/screens/survey/view.dart';
import 'core/bloc_observer/my_bloc_observer.dart';
import 'core/database/remote/dioHelper/dioHelper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  // Disable screen rotation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(BlocProvider(
    create: (context) => AppController(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppController, AppStates>(
      buildWhen: (previousState, currentState) => false,
      listener: (context, state) {},
      builder: (context, state) => ScreenUtilInit(
        designSize: const Size(430, 932),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) => MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              elevation: 0,
              color: AppColors.darkBlue,
              titleTextStyle: TextStyle(
                color: AppColors.darkOrange,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: child,
        ),
        child: ProfileScreen(),
      ),
    );
  }
}

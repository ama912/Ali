import 'package:ali/core/routing/routes.dart' show Routes;
import 'package:ali/features/login/ui/login_screen.dart' show LoginScreen;
import 'package:ali/features/onboarding/onboarding.dart' show OnboardingScreen;
import 'package:flutter/material.dart';

class AppRouter {
  //?فيه منطق التنقل بين الصفحات
  Route generateRoute(RouteSettings setting) {
    // this arguments to be passed in any screen like this (arguments as ClassName)
    final arguments = setting.arguments;

    // المطلوب route اسم ال
    switch (setting.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnboardingScreen(
            // اذا بدي مرر هيك بمرر
            //arguments : 'arguments',
          ),
        );
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text(' No route defined for ${setting.name}')),
          ),
        );
    }
  }
}
/*
أهم فائدة لها أنها تعطيك تحكمًا أكبر من   
 العادية، خصوصًا عندما تريد routes

تمرير بيانات بين الصفحات.

التحقق من نوع البيانات.

إظهار صفحة خطأ إذا كان المسار غير معروف
*/
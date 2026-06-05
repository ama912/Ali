// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ali/core/routing/app_router.dart' show AppRouter;
import 'package:ali/core/routing/routes.dart' show Routes;
import 'package:ali/core/theming/colors.dart' show ColorsManager;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show ScreenUtilInit;

class DocApp extends StatelessWidget {
  //  appRouterب  doc-appهيك ربطت ال
  final AppRouter appRouter;
  const DocApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    //responsive يساعدك تخلي واجهة التطبيق
    return ScreenUtilInit(
      //  مقاس التصميم الذي اعتمدت عليه عند تصميم الواجهة الأصلية
      // يعني أنت تقول للمكتبة: “اعتبر أن التصميم الأساسي كان بعرض 375 وارتفاع 812
      designSize: const Size(375, 812),
      minTextAdapt: true, // يجعل النصوص تتكيف بشكل أفضل مع اختلاف أحجام الشاشات
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Doc App',
        theme: ThemeData(
          primaryColor: ColorsManager.mainBlue,
          scaffoldBackgroundColor: Colors.white,
        ),
        // اول ما افتح التطبيق رح يفتح ال
        initialRoute: Routes.onBoardingScreen, //يحدد من أين يبدأ التطبيق
        onGenerateRoute:
            appRouter.generateRoute, //يحدد كيف تُبنى الصفحة المطلوبة
      ),
    );
  }
}

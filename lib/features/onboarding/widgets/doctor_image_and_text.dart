import 'package:ali/core/theming/styles.dart' show TextStyles;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart' show SvgPicture;

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      //يسمح بوضع عناصر فوق بعضها (طبقات)
      children: [
        // Stack هذا الشعار يظهر في الخلفية الكاملة للـ
        SvgPicture.asset('assets/svgs/docdoc_logo_low_opacity.svg'),
        Container(
          //بيعمل طبقة شفافة فوق الصورة بدون ما يخفيها  foregroundDecoration
          foregroundDecoration: BoxDecoration(
            //التدرج
            gradient: LinearGradient(
              //هو تدرج لوني خطي (من نقطة لنقطة بخط مستقيم) ← بيخلق تأثير انتقال ناعم من لون لآخر
              // الالوان من تحت لفوق
              // من فوق (alpha = 0) الألوان في التدرج: أبيض كامل من أسفل، ثم أبيض شفاف تماماً
              //   يعني يختفي تدريجيا
              colors: [Colors.white, Colors.white.withValues(alpha: 0.0)],
              // bottomCenter التدرج يبدأ من  (أسفل الوسط)
              // topCenter وينتهي عند  (فوق الوسط)
              //يعني يتلاشى من الأسفل للأعلى
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              //يحدد متى يتوقف كل لون: 0.14 (14% من الأسفل) للتوقف الأول
              // و  0.4 (40%) للتوقف الثاني
              //يعني التدرج ينتهي عند 40% من الأعلى.
              stops: const [0.14, 0.4], //gradient وين رح يوقف ال
            ),
          ),

          child: Image.asset('assets/images/onboarding_doctor.png'),
          // مع التدرج اللوني الذي يجعلها تتلاشى من الأسفل container فوق  PNG يعرض صورة
          //تدرج أبيض يتلاشى من الأسفل للأعلى فوق الصورة
        ),

        Positioned(
          //  stack يعرف موقع النص داخل ال
          bottom: 30, //يعني 30 بكسل من الأسفل
          //يعني يمتد من اليمين لليسار (عرض كامل)
          right: 0,
          left: 0,
          child: Text(
            'Best Doctor\n Appointment App',
            textAlign: TextAlign.center,
            //  معناها استخدم يلي هنيك بس هون رح ضيف ميزة زيادة: copywith
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}

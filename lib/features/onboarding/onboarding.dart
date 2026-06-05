import 'package:ali/core/theming/styles.dart' show TextStyles;
import 'package:ali/features/onboarding/widgets/doc_logo_and_name.dart'
    show DocLogoAndName;
import 'package:ali/features/onboarding/widgets/doctor_image_and_text.dart'
    show DoctorImageAndText;
import 'package:ali/features/onboarding/widgets/get_started_button.dart'
    show GetStartedButton;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              top: 30.h,
              bottom: 30.h, // بتخلي ال30 نسبي على الاندرويد والايفون
            ),
            child: Column(
              children: [
                //  صغيرة sub widgets الى screen بقسم ال
                //?  widgets أول
                const DocLogoAndName(),
                SizedBox(height: 30.h),
                const DoctorImageAndText(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    children: [
                      Text(
                        'Manage and schedule all of your medical appointments easily with Docdoc to get a new experience.',
                        style: TextStyles.font13GrayReqular,
                        textAlign: TextAlign.center,
                      ),

                      SizedBox(height: 30.h),
                      const GetStartedButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

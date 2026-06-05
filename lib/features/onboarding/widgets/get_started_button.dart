import 'package:ali/core/helpers/extensions.dart' show Navigation;
import 'package:ali/core/routing/routes.dart' show Routes;
import 'package:ali/core/theming/colors.dart' show ColorsManager;
import 'package:ali/core/theming/styles.dart' show TextStyles;
import 'package:flutter/material.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      style: ButtonStyle(
        //بيحدد تصميم الزر
        //لون خلفية الزر
        //  يعني اللون بيطبق على جميع الحالات (طبيعي، ضغط، تعطيل) : WidgetStateProperty
        backgroundColor: WidgetStateProperty.all(ColorsManager.mainBlue),
        //جم منطقة اللمس (المنطقة اللي بتستجيب للمس)
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        // يطبق على جميع الحالات   الحدالأدنى لحجم الزر
        //  يعني حجم اللمس بيتناسب مع حجم الزر بالضبط : WidgetStateProperty
        minimumSize: WidgetStateProperty.all(const Size(double.infinity, 52)),
        shape: WidgetStateProperty.all(
          // piksel نصف قطر الزوايا:  16
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
      ),
      child: Text('Get Started', style: TextStyles.font16whitSemiBold),
    );
  }
}

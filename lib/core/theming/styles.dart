import 'package:ali/core/theming/colors.dart' show ColorsManager;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  //TextStyles صار بمجرد ما استدعي اسم ال
  // Weight و size بقدر اعرف اللون و حجم الخط

  // ط1
  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp, // font الخاصة بال  flutter_screenutil الخاصة بمكتبة ال  sp
    fontWeight: FontWeight.w700,
    color: Colors.black,
  );
  // في التسمية  ط2

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: ColorsManager.mainBlue,
  );

  static TextStyle font13GrayReqular = TextStyle(
    fontSize: 13.sp,
    fontWeight: FontWeight.normal,
    color: ColorsManager.gray,
  );

  static TextStyle font16whitSemiBold = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
}

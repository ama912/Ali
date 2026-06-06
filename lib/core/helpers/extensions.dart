import 'package:flutter/material.dart';

extension Navigation on BuildContext {
  //?BuildContext الكود يضيف دوال جديدة على
  //BuildContext أضف دوال جديدة إلى
  //  Navigationتحت اسم
  // داخل التطبيق تستطيع استخدام هذه الدوال مباشرة context  بعدها اي
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    // يضيف صفحة جديدة فوق الستاك pushNamed
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    //  يستبدل الصفحة الحالية pushReplacementNamed
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    // يضيف صفحة ثم يزيل صفحات حسب الشرط pushNamedAndRemoveUntil
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  // يحذف آخر صفحة ويرجع للي قبلهاpop
  void pop() => Navigator.of(this).pop();
}

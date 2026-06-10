import 'package:ali/core/helpers/spacing.dart';
import 'package:ali/core/theming/styles.dart';
import 'package:flutter/material.dart';

class Buildheader extends StatelessWidget {
  const Buildheader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('الملف الشخصي', style: TextStyles.font32BlackBold),
        verticalSpace(6),
        Text(
          'وثّق معلوماتك الأكاديمية والشخصية',
          style: TextStyles.font14GrayReqular,
        ),
      ],
    );
  }
}

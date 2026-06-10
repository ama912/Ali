import 'package:ali/core/theming/colors.dart';
import 'package:ali/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Appbar extends StatelessWidget implements PreferredSizeWidget {
  const Appbar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF2F4F8),
      elevation: 0,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.arrow_back, color: ColorsManager.mainBlue),
      ),
      title: Text('Student portal', style: TextStyles.font20BlueBold),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.person, color: Colors.white, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}

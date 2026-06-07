import 'package:ali/core/helpers/spacing.dart';
import 'package:ali/core/theming/styles.dart';
import 'package:ali/core/widgets/app_text_button.dart';
import 'package:ali/core/widgets/app_text_form_field.dart';
import 'package:ali/features/login/ui/widgets/already_have_account_text.dart'
    show AlreadyHaveAccountText;
import 'package:ali/features/login/ui/widgets/terms_and_conditions_text.dart'
    show TermsAndConditionsText;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart' show SizeExtension;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //للتحقق من ال form من الخارج
  final formKey = GlobalKey<FormState>();
  bool isObrcureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcom Back', style: TextStyles.font24BlueBold),
                verticalSpace(8),
                //  SizedBox(height: 8.h),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14GrayReqular,
                ),
                verticalSpace(36),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      AppTextFormField(hintText: 'Email'),
                      verticalSpace(18),
                      AppTextFormField(
                        hintText: 'Password',
                        isObscureText: isObrcureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isObrcureText = !isObrcureText;
                            });
                          },
                          child: Icon(
                            isObrcureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                        ),
                      ),
                      verticalSpace(24),
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Text(
                          'Forgot Password ?',
                          style: TextStyles.font13BlueRegular,
                        ),
                      ),
                      verticalSpace(40),
                      AppTextButton(
                        buttonText: 'Login',
                        textStyle: TextStyles.font16whitSemiBold,
                        onPressed: () {},
                      ),

                      verticalSpace(16),
                      const TermsAndConditionsText(),
                      verticalSpace(60),
                      const AlreadyHaveAccountText(),
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

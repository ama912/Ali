import 'package:ali/core/helpers/app_regex.dart';
import 'package:ali/core/helpers/spacing.dart' show verticalSpace;
import 'package:ali/core/widgets/app_text_form_field.dart'
    show AppTextFormField;
import 'package:ali/features/login/logic/cubit/login_cubit.dart';
import 'package:ali/features/login/ui/widgets/password_validations.dart'
    show PasswordValidations;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  //من الخارج form للتحقق من ال
  bool isObrcureText = true;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasNumber = false;
  bool hasMinLength = false;

  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    //cubit في ال  property  بهي الطريقة بقدر نادي ل اي
    passwordController = context.read<LoginCubit>().passwordController;

    setupPasswordControllerListener();
  }

  void setupPasswordControllerListener() {
    //يلي عم يدخلها المستخدم text منشان يتسمع على اي تغير بصير على
    passwordController.addListener(() {
      setState(() {
        // تتغيرbool من شان قيمة
        // PasswordValidations ولما القيمة تتغير تعطيها ل
        //او لا ٍ hasLowerCase بدي خليه يتاكد اذا النص يلي دخله فيه
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasSpecialCharacters = AppRegex.hasSpecialCharacter(
          passwordController.text,
        );
        hasNumber = AppRegex.hasNumber(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: 'Email',
            validator: (value) {
              //يلي رح يدخلها المستخدم
              //   كتب ومسح      ما كتب شي                Valid  الايميل مو
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),

          verticalSpace(18),

          AppTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            hintText: 'Password',
            isObscureText: isObrcureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObrcureText = !isObrcureText;
                });
              },
              child: Icon(
                isObrcureText ? Icons.visibility_off : Icons.visibility,
              ),
            ),
          ),
          verticalSpace(24),

          PasswordValidations(
            // بتاخد القيم وبتبلش تتحقق وتشطب على كل وحده منن
            hasLowerCase: hasLowerCase,
            hasUpperCase: hasUpperCase,
            hasSpecialCharacters: hasSpecialCharacters,
            hasNumber: hasNumber,
            hasMinLength: hasMinLength,
          ),
        ],
      ),
    );
  }

  //listener لازم دمر ال  widgetوبتسمع عليه ولما بطلع من هي ال  controller عملت
  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}

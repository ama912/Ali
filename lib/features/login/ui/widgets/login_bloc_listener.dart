import 'package:ali/core/helpers/extensions.dart';
import 'package:ali/core/routing/routes.dart';
import 'package:ali/core/theming/colors.dart';
import 'package:ali/core/theming/styles.dart';
import 'package:ali/features/login/logic/cubit/login_cubit.dart';
import 'package:ali/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocListener;

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      //Loading &.. هي  state  اذا كانت ال  listen ايمت رح اعمل
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        // عندما واحدة او لا
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(color: ColorsManager.mainBlue),
              ),
            );
          },
          success: (loginResponse) {
            context.pop(); //dialog منشان اطلع من ال
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
            setUpErrorState(context, error);
          },
        );
      },
      //space اصغر
      child: const SizedBox.shrink(),
    );
  }

  //------------------

  void setUpErrorState(BuildContext context, String error) {
    context.pop();
    //backend واعرض الرسالة الجاي من ال  dialog رح اعرض

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(Icons.error, color: Colors.red, size: 32),
        content: Text(error, style: TextStyles.font15DarkBlueMedium),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text('Got it', style: TextStyles.font14BlueSemiBold),
          ),
        ],
      ),
    );
  }
}

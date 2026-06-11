import 'package:ali/core/networking/api_result.dart' show ApiResultPatterns;
import 'package:ali/features/sign_up/data/models/sign_up_request_body.dart'
    show SignupRequestBody;
import 'package:ali/features/sign_up/data/repo/sing_up_repo.dart';
import 'package:ali/features/sign_up/logic/cubit/sign_up_state.dart'
    show SignUpState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignupCubit extends Cubit<SignUpState> {
  final SingUpRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(const SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignupStates() async {
    emit(const SignUpState.signupLoading());
    final response = await _signupRepo.signup(
      SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0, //ثبتت القيمة انها صفر
      ),
    );
    response.when(
      success: (signupResponse) {
        emit(SignUpState.signupSuccess(signupResponse));
      },
      failure: (error) {
        emit(SignUpState.signupError(error: error.apiErrorModel.message ?? ''));
      },
    );
  }
}

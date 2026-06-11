import 'package:freezed_annotation/freezed_annotation.dart'
    show DeepCollectionEquality, freezed, optionalTypeArgs, useResult;
import 'package:json_annotation/json_annotation.dart' show JsonKey;

part 'sign_up_state.freezed.dart';

@freezed
class SignUpState<T> with _$SignUpState<T> {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.signupLoading() = SignupLoading;
  const factory SignUpState.signupSuccess(T data) = SignupSuccess<T>;
  const factory SignUpState.signupError({required String error}) = SignupError;
}

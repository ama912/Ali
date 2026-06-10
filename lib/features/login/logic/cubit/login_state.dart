import 'package:flutter/material.dart' show optionalTypeArgs;
import 'package:freezed_annotation/freezed_annotation.dart'
    show DeepCollectionEquality, freezed, useResult;
import 'package:json_annotation/json_annotation.dart' show JsonKey;

part 'login_state.freezed.dart';

@freezed //cubit & state استخدمها مع ال
class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial; // privateلان مارح استخدمها
  //جاهز بس ما اجاني ولا طلب

  const factory LoginState.loading() = Loading;

  const factory LoginState.success(T data) = Success<T>;

  const factory LoginState.error({required String error}) = Error;
  // small i will use in cubit
  // capital i will use  in ui
}

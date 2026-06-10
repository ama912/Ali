import 'package:ali/core/networking/api_error_handler.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_result.freezed.dart';

@Freezed()
//         type   اي  T يعني  بياخد اي شي
abstract class ApiResult<T> with _$ApiResult {
  const factory ApiResult.success(T data) = Success<T>;
  //كله object خليته يستقبل ال
  const factory ApiResult.failure(ErrorHandler errorHandler) = Failure<T>;
}

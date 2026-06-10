import 'package:json_annotation/json_annotation.dart';
part 'api_error_model.g.dart';

//يلي رح تجيني error يلي رح همدل فيه كل ال
// error handlingلل  base class هو ال
@JsonSerializable()
class ApiErrorModel {
  final String? message;
  final int? code;

  ApiErrorModel({required this.message, this.code});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorModelToJson(this);
}

import 'package:ali/core/networking/api_constants.dart';
import 'package:ali/features/login/data/models/login_request_body.dart'
    show LoginRequestBody;
import 'package:ali/features/login/data/models/login_response.dart'
    show LoginResponse;
import 'package:dio/dio.dart' show Dio, Options, RequestOptions, ResponseType;
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart'; //بهاد المكان generate اعمل

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  // we inject Dio instance to ApiService
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //login تبع ال  api call اول
  // رح اعمل login api
  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}

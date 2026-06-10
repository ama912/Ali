import 'package:dio/dio.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();

  static Dio? dio;
  // singleton طبقت
  //  واحد من شي شغلة وما انشء نسخ اخرى  object  انشثت
  static Dio getDio() {
    Duration timeOut = const Duration(seconds: 30);

    if (dio == null) {
      // if dio =null create new instance
      dio = Dio(); //create new instance
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      // addDioHeaders();
      addDioInterceptor();
      return dio!;
    } else {
      return dio!;
    }
  }

  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        //debug console في ال  api شو بعتت وشو رجع بكل api request  هي بتطالع شكل
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}

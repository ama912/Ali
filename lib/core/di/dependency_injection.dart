import 'package:ali/core/networking/api_service.dart';
import 'package:ali/core/networking/dio_factory.dart';
import 'package:ali/features/login/data/repos/login_repo.dart';
import 'package:ali/features/login/logic/cubit/login_cubit.dart';
import 'package:dio/dio.dart' show Dio;
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //? Dio & ApiService
  //future بخليه  DioFactory لازم نراجه شغله واذا هيك بعدلها ضمن ال
  // Dio dio = await DioFactory.getDio();

  Dio dio = DioFactory.getDio();

  //one instanse
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  //? login

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(loginRepo: getIt()),
  ); //constructor named لان عاملة ال

  //?home
  //dio & ApiService ماني بحاجة اعمل ال
  //home repo & cubit بعمل ال
}

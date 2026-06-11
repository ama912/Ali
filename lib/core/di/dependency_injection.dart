import 'package:ali/core/networking/api_service.dart';
import 'package:ali/core/networking/dio_factory.dart';
import 'package:ali/features/login/data/repos/login_repo.dart';
import 'package:ali/features/login/logic/cubit/login_cubit.dart';
import 'package:ali/features/sign_up/data/repo/sing_up_repo.dart'
    show SingUpRepo;
import 'package:ali/features/sign_up/logic/cubit/sign_up_cubit.dart';
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
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(loginRepo: getIt()),
  ); //constructor named لان عاملة ال

  //? Signup
  getIt.registerLazySingleton<SingUpRepo>(
    () => SingUpRepo(getIt()),
  ); //معناها انشء نسخة واحة فقط واستخدمها بكل التطبيق تبعي registerLazySingleton
  getIt.registerFactory<SignupCubit>(
    () => SignupCubit(getIt()),
  ); // يعني كل مرة بستخدم هي الشغلة انشئلي منها نسخة جديدة Factory
  //cubit بحطها لل
  //bloc lazy بخلي ال  bloc provider
  //  بدمر نفسه بنفسه لما ما بستخدمهcubit
  // إلا لما احتاجه lazy وما بكريت نفسه وبكون
  //?home
  //dio & ApiService ماني بحاجة اعمل ال
  //home repo & cubit بعمل ال
}

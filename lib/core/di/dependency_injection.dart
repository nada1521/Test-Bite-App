import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tasty_bite/feature/search/logic/search_by_letter_cubit.dart';
import '../../feature/auth/login/data/repos/login_repo.dart';
import '../../feature/auth/login/view/logic/login_cubit.dart';
import '../../feature/auth/signup/data/repos/signup_repos.dart';
import '../../feature/auth/signup/view/logic/sign_up_cubit.dart';
import '../../feature/favorit/view/cubit/favorit_cubit.dart';
import '../../feature/home/data/repos/menu_repo.dart';
import '../../feature/home/data/service/menu_api_service.dart';
import '../../feature/home/view/logic/category_list/category_cubit.dart';
import '../../feature/home/view/logic/failter_category/failter_category_cubit.dart';
import '../../feature/home/view/logic/item_details/item_details_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  final dio = await DioFactory.getDio();

  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<MenuApiService>(
    () => MenuApiService(getIt<Dio>()),
  );

  // Sighn Up
  getIt.registerLazySingleton<SignupRepos>(() => SignupRepos());
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepos>()));
  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));

  //  Repos
  getIt.registerLazySingleton<MenuRepo>(
    () => MenuRepo(menuApiService: getIt<MenuApiService>()),
  ); 

  // favorit cubit
  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());
  // search cubit
  getIt.registerFactory<SearchByLetterCubit>(
    () => SearchByLetterCubit(getIt<MenuRepo>()),
  );
  // all category cubit
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt<MenuRepo>()));
  // cuntry cubit
  getIt.registerFactory<FailterCategoryCubit>(
    () => FailterCategoryCubit(getIt<MenuRepo>()),
  );
  // Item details
  getIt.registerFactory<ItemDetailsCubit>(
    () => ItemDetailsCubit(getIt<MenuRepo>()),
  );
}

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Future<Dio> getDio() async {
    if (_dio == null) {
      _dio = Dio();
      _dio!.options.connectTimeout = Duration(minutes: 1);
      _dio!.options.receiveTimeout = Duration(minutes: 1);
      _dio!.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          error: true,
          compact: true,
        ),
      );
    }
    return _dio!;
  }
}

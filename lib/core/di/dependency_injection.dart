import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:tasty_bite/feature/home/views/logic/searchbyletter_cubit.dart';
import '../../feature/auth/login/data/repos/login_repo.dart';
import '../../feature/auth/login/view/logic/login_cubit.dart';
import '../../feature/auth/signup/data/repos/signup_repos.dart';
import '../../feature/auth/signup/logic/sign_up_cubit.dart';
import '../../feature/favorit/view/cubit/favorit_cubit.dart';
import '../../feature/menu/data/repos/menu_repo.dart';
import '../../feature/menu/data/service/menu_api_service.dart';
import '../../feature/menu/view/logic/category_list/category_cubit.dart';
import '../../feature/menu/view/logic/failter_category/failter_category_cubit.dart';
import '../../feature/menu/view/logic/item_details/item_details_cubit.dart';
import '../helper/maps_services.dart';

final getIt = GetIt.instance;

Future<void> setupGetit() async {
  final dio = await DioFactory.getDio();
  getIt.registerLazySingleton<MenuRepo>(
    () => MenuRepo(menuApiService: MenuApiService(dio)),
  );
  getIt.registerLazySingleton<FavoritesCubit>(() => FavoritesCubit());
 getIt.registerFactory<SearchbyletterCubit>(() => SearchbyletterCubit(getIt<MenuRepo>()));
 
  getIt.registerFactory<CategoryCubit>(() => CategoryCubit(getIt<MenuRepo>()));
  getIt.registerFactory<FailterCategoryCubit>(
    () => FailterCategoryCubit(getIt<MenuRepo>()),
  );
  getIt.registerFactory<ItemDetailsCubit>(
    () => ItemDetailsCubit(getIt<MenuRepo>()),
  );
  // getIt.registerLazySingleton<SupabaseAuthService>(() => SupabaseAuthService());
  // Sighn Up
  getIt.registerLazySingleton<SignupRepos>(() => SignupRepos());
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt<SignupRepos>()));
  // get address
  getIt.registerLazySingleton<MapsServices>(() => MapsServices());
  // getIt.registerLazySingleton<GetAddressCubit>(() => GetAddressCubit(getIt()));
  // Login
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo());
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  // Adding Product
  // Bottom NavBar Navigator
  // getIt.registerFactory<BottomNavBarNavigatorCubit>(
  //   () => BottomNavBarNavigatorCubit(),
  // );

  // _______________
  //___________________
  // Admin Version
  // __________________________________
  // Get All Users And Send Notifcations

  // Search For Products
  // getIt.registerLazySingleton<SearchForProductsCubit>(() => GetAllOrdersRepo());
  // getIt.registerFactory<SearchForProductsCubit>(() => SearchForProductsCubit(getIt()));
  // getIt.registerFactory<SearchForUserCubit>(() => SearchForUserCubit(getIt()));

  // getIt.registerFactory<SearchForOrdersCubit>(() => SearchForOrdersCubit(getIt()));
  // getIt.registerLazySingleton<SearchForOrdersRepo>(() => SearchForOrdersRepo());
}

class DioFactory {
  // Singleton Instance
  // static final DioFactory _instance = DioFactory._internal();
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

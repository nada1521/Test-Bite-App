import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasty_bite/feature/auth/signup/view/logic/user_data_cubit.dart';
import 'package:tasty_bite/feature/search/logic/search_by_letter_cubit.dart';
import 'package:tasty_bite/feature/search/view/screen/search_screen.dart';
import 'package:tasty_bite/feature/settings/view/logic/change_password_cubit.dart';
import 'package:tasty_bite/feature/settings/view/screens/change_password_screen.dart';
import 'package:tasty_bite/feature/settings/view/screens/setings_screen.dart';
import '../../feature/auth/login/view/logic/login_cubit.dart';
import '../../feature/auth/login/view/screen/login_screen.dart';
import '../../feature/auth/signup/view/logic/sign_up_cubit.dart';
import '../../feature/auth/signup/view/screen/signup_screen.dart';
import '../../feature/favorit/view/cubit/favorit_cubit.dart';
import '../../feature/favorit/view/screen/favorit_screen.dart';
import '../../feature/layout/screens/home_and_drawer_screen.dart';
import '../../feature/home/data/models/category_menu_respons_model.dart';
import '../../feature/home/data/models/filter_category_response_model.dart';
import '../../feature/home/view/logic/category_list/category_cubit.dart';
import '../../feature/home/view/logic/failter_category/failter_category_cubit.dart';
import '../../feature/home/view/logic/item_details/item_details_cubit.dart';
import '../../feature/home/view/screens/item_details_screen.dart';
import '../../feature/home/view/screens/menu_item_screen.dart';
import '../../feature/home/view/screens/home_screen.dart';
import '../di/dependency_injection.dart';
import 'app_router_path.dart';

class AppRouter {
  Route? generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider<SignupCubit>(
            create: (context) => getIt<SignupCubit>(),
            child: const SignupScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: LoginScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.menueItem:
        final args = settings.arguments as CategoryModel;
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) =>
                getIt<FailterCategoryCubit>()
                  ..getAllCategory(categoryName: args.categoryName),
            child: MenuItemScreen(categoryModel: args),
          ),
          settings: settings,
        );
      case AppRoutes.itemDetails:
        final args = settings.arguments as ItemMenuModel;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) =>
                    getIt<ItemDetailsCubit>()
                      ..getItemDetails(itemID: args.itemId),
              ),
              BlocProvider.value(value: getIt<FavoritesCubit>()),
            ],
            child: ItemDetailsScreen(itemDetails: args),
          ),
          settings: settings,
        );
      case AppRoutes.favScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: getIt<FavoritesCubit>(),
            child: FavoritScreen(),
          ),
          settings: settings,
        );
      case AppRoutes.homeScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (_) => getIt<CategoryCubit>()..getAllCategory(),
            child: HomeScreen(
              onPressed: () {},
              countryName: settings.arguments as String?,
            ),
          ),
        );
      case AppRoutes.changePasswordScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => ChangePasswordCubit(),
            child: ChangePasswordScreen(),
          ),
        );
      case AppRoutes.settingScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<UserDataCubit>(
            create: (_) => UserDataCubit()..loadUserData(),
            child: SetingsScreen(),
          ),
        );
      case AppRoutes.searchScreen:
        return MaterialPageRoute(
          builder: (context) => BlocProvider<SearchByLetterCubit>(
            create: (_) => getIt<SearchByLetterCubit>(),
            child: SearchScreen(),
          ),
        );

      case AppRoutes.homeAndDrowerScreen:
        final countryName = settings.arguments as String?;
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider<CategoryCubit>(
                create: (context) => getIt<CategoryCubit>()..getAllCategory(),
              ),
              BlocProvider<ItemDetailsCubit>(
                create: (context) => getIt<ItemDetailsCubit>(),
              ),
              BlocProvider(create: (context) => getIt<FailterCategoryCubit>()),
              BlocProvider<UserDataCubit>(
                create: (context) => UserDataCubit()..loadUserData(),
              ),
            ],
            child: HomeAndDrawerAnimatedScreen(countryName: countryName),
          ),
        );
      default:
        debugPrint('> Not found page: ${settings.name}');
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
          settings: settings,
        );
    }
  }
}

import 'package:afectod/app/common/router/route.path.dart';
import 'package:afectod/app/features/data/models/movies/movie_model.dart';
import 'package:afectod/app/features/presentation/auth/view/auth_view.dart';
import 'package:afectod/app/features/presentation/auth/view/change_password_view.dart';
import 'package:afectod/app/features/presentation/detail/view/detail_view.dart';
import 'package:afectod/app/features/presentation/main/view/main_view.dart';
import 'package:afectod/app/features/presentation/search/view/search_view.dart';
import 'package:afectod/app/features/presentation/splash/view/splash_view.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/widgets.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: SplashRoute.page,
      path: RoutePath.splash.value,
      initial: true,
    ),
    CustomRoute(
      page: MainRoute.page,
      path: RoutePath.main.value,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      duration: Duration.zero,
      reverseDuration: Duration.zero,
    ),
    CustomRoute(
      page: AuthRoute.page,
      path: RoutePath.auth.value,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
      duration: Duration.zero,
      reverseDuration: Duration.zero,
    ),
    AutoRoute(
      page: ChangePasswordRoute.page,
      path: RoutePath.changePassword.value,
    ),
    AutoRoute(
      page: DetailRoute.page,
      path: RoutePath.detail.value,
    ),
    AutoRoute(
      page: SearchRoute.page,
      path: RoutePath.search.value,
    ),
  ];
}

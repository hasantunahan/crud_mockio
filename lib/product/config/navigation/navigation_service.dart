import 'package:crud_mockio/product/config/navigation/navigation_route.dart';
import 'package:crud_mockio/ui/home/subview/add_new_chef/view/add_new_chef.dart';
import 'package:crud_mockio/ui/home/subview/chef_detail/view/chef_detail_view.dart';
import 'package:crud_mockio/ui/home/view/home_view.dart';
import 'package:crud_mockio/ui/splash/view/splash_view.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

class NavigationService {
  NavigationService._init();

  static NavigationService? _instance;

  static NavigationService get instance {
    return _instance ??= NavigationService._init();
  }

  BuildContext? get applicationContext => router.navigator?.context;
  final RouteObserver<ModalRoute<void>> routeObserver = RouteObserver<ModalRoute<void>>();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  late final GoRouter router = GoRouter(
    observers: [routeObserver],
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        path: NavigationRoute.instance.splash,
        builder: (context, state) => const SplashView(),
        routes: [
          GoRoute(
            path: NavigationRoute.instance.homePath,
            builder: (context, state) => const HomeView(),
            routes: [
              GoRoute(
                path: NavigationRoute.instance.addNewChefPath,
                builder: (context, state) => const AddNewChef(),
              ),
              GoRoute(
                path: NavigationRoute.instance.chefDetailPath,
                builder: (context, state) {
                  final userId = state.params['id'] ?? '';
                  return ChefDetail(userId: userId);
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}

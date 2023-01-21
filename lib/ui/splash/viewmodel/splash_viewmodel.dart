import 'package:crud_mockio/product/config/navigation/navigation_route.dart';
import 'package:crud_mockio/product/config/navigation/navigation_service.dart';
import 'package:injectable/injectable.dart';
import "package:mobx/mobx.dart";

part "splash_viewmodel.g.dart";

@Injectable(as: ISplashViewModel)
class SplashViewModel = ISplashViewModel with _$SplashViewModel;

abstract class ISplashViewModel with Store {
  init() {
    Future.delayed(const Duration(seconds: 2), () {
      goHome();
    });
  }

  void goHome() {
    NavigationService.instance.router.replace(NavigationRoute.instance.goHome);
  }
}

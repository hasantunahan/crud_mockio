class NavigationRoute {
  NavigationRoute._init();

  static NavigationRoute? _instance;

  static NavigationRoute get instance {
    return _instance ??= NavigationRoute._init();
  }

  String get splash => '/';


}

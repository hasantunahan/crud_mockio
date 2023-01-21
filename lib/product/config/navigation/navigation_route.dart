class NavigationRoute {
  NavigationRoute._init();

  static NavigationRoute? _instance;

  static NavigationRoute get instance {
    return _instance ??= NavigationRoute._init();
  }

  String get splash => '/';
  // home manage
  String get homePath => 'home';
  String get goHome => '/home';

  // add new chef
  String get addNewChefPath => "addNewChef";
  String get goAddNewChefPath => "/home/addNewChef";

  //  chef detail
  String get chefDetailPath => "chefDetailPath/:id";
  String goChefDetailPath(String id) => "/home/chefDetailPath/$id";
}

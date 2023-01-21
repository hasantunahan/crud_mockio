import 'package:crud_mockio/product/extension/string_extension.dart';

class Assets {
  Assets._init();
  static Assets? _instance;
  static Assets get instance {
    return _instance ??= Assets._init();
  }

  Png get png => Png.instance;
}

class Png {
  Png._init();
  static Png? _instance;
  static Png get instance {
    return _instance ??= Png._init();
  }

  String get splashView => "splash_view".toPng;
}

import 'package:crud_mockio/product/config/environment/presets/i_environment_preset.dart';
import 'package:crud_mockio/product/config/environment/presets/prod_environment_preset.dart';
import 'package:crud_mockio/product/config/environment/presets/test_environment_preset.dart';
import 'package:crud_mockio/product/config/environment/presets/uat_environment_preset.dart';

class EnvironmentPreset {
  EnvironmentPreset._init();
  static EnvironmentPreset? _instance;
  static EnvironmentPreset get instance {
    _instance ??= EnvironmentPreset._init();
    return _instance!;
  }

  static const String test = 'test';
  static const String uat = 'uat';
  static const String prod = 'prod';

  IEnvironmentPreset config = UatEnvironmentPreset();

  void initConfig(String environment) {
    config = _getConfig(environment);
  }

  IEnvironmentPreset _getConfig(String environment) {
    switch (environment) {
      case EnvironmentPreset.prod:
        return ProdEnvironmentPreset();
      case EnvironmentPreset.test:
        return TestEnvironmentPreset();
      default:
        return UatEnvironmentPreset();
    }
  }
}

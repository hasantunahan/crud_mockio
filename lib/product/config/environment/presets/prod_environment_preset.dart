import 'package:crud_mockio/product/config/environment/presets/i_environment_preset.dart';

class ProdEnvironmentPreset implements IEnvironmentPreset {
  @override
  String get apiBaseUrl => "https://63cac723f36cbbdfc7600797.mockapi.io";

  @override
  String get applicationId => "prod";

  @override
  String get applicationName => "prod";

  @override
  String get versionCode => "3";

  @override
  String get versionName => "3.0.0";

}

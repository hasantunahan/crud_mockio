import 'package:crud_mockio/product/config/environment/presets/i_environment_preset.dart';


class TestEnvironmentPreset implements IEnvironmentPreset {
  @override
  String get apiBaseUrl => "https://63cac723f36cbbdfc7600797.mockapi.io";

  @override
  String get applicationId => "test";

  @override
  String get applicationName => "test";

  @override
  String get versionCode => "1";

  @override
  String get versionName => "1.0.0";
}

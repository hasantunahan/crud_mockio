import 'package:crud_mockio/product/config/environment/presets/i_environment_preset.dart';

class UatEnvironmentPreset implements IEnvironmentPreset {
  @override
  String get apiBaseUrl => "https://63cac723f36cbbdfc7600797.mockapi.io";

  @override
  String get applicationId => "neyasis.case.uat";

  @override
  String get applicationName => "Neyasis Uat";

  @override
  String get versionCode => "2";

  @override
  String get versionName => "2.0.0";
}

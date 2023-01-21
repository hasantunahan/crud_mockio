import 'package:crud_mockio/network/api/i_api.dart';
import 'package:crud_mockio/product/config/environment/environment_preset.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IApi)
class Api implements IApi {
  final _timeout = 20000; // 20 seconds

  @override
  Dio createDio() {
    return Dio(
      BaseOptions(
        baseUrl: EnvironmentPreset.instance.config.apiBaseUrl,
        connectTimeout: _timeout,
      ),
    );
  }
}

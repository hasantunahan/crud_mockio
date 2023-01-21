import 'package:dio/dio.dart';

abstract class IApi {
  Dio createDio();
}

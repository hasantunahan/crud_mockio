import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:crud_mockio/injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void injectAll({String? environment}) {
  $initGetIt(getIt, environment: environment);
}

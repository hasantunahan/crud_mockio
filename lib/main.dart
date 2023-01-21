import 'package:crud_mockio/injection.dart';
import 'package:flutter/material.dart';
import 'product/config/environment/environment_preset.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final env = _setEnvironment();
  injectAll(environment: env);
  runApp(
    const MyApp(),
  );
}

String _setEnvironment() {
  // flutter run --dart-define=ENVIRONMENT=uat     --> or prod or test
  // flutter build apk --dart-define=ENVIRONMENT=uat    --> or prod or test
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: EnvironmentPreset.uat,
  );
  EnvironmentPreset.instance.initConfig(environment);
  return environment;
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRUD MOCKIO',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(),
    );
  }
}

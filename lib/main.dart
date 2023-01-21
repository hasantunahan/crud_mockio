import 'package:crud_mockio/generated/l10n.dart';
import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/config/navigation/navigation_service.dart';
import 'package:crud_mockio/product/manager/provider/child/language_provider.dart';
import 'package:crud_mockio/product/manager/provider/provider_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'product/config/environment/environment_preset.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final env = _setEnvironment();
  injectAll(environment: env);
  runApp(
    MultiProvider(
      providers: ProviderManager.instance.listOfProvider,
      child: const MyApp(),
    ),
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
    return MaterialApp.router(
      title: 'CRUD MOCKIO',
      locale:
          Provider.of<LanguageProvider>(context, listen: true).currentLocale,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      debugShowCheckedModeBanner: false,
      supportedLocales: S.delegate.supportedLocales,
      routerDelegate: NavigationService.instance.router.routerDelegate,
      routeInformationProvider:
          NavigationService.instance.router.routeInformationProvider,
      routeInformationParser:
          NavigationService.instance.router.routeInformationParser,
    );
    ;
  }
}

import 'package:crud_mockio/product/constant/app_key.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:crud_mockio/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<void> wait([int? delay]) async {
    final int time = delay ?? 500;
    await Future.delayed(Duration(milliseconds: time));
  }

  /// TODO : i created a minimal test run
  group('end-to-end test', () {
    testWidgets('Crud mock_io automation test', (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await wait(2200);
      await tester.pumpAndSettle();
      await wait(4000);
      final settingsButton = find.byKey(AppKey.instance.settingsButton);
      await tester.tap(settingsButton);
      await wait(2000);
      await tester.tap(settingsButton);
      await wait(2000);
      await tester.pumpAndSettle();
      await wait(4000);
      final findAddNewChefButton = find.byKey(AppKey.instance.addNewChef);
      await tester.tap(findAddNewChefButton);
      await tester.pumpAndSettle();
      await wait(2200);
      final findBackButton = find.byType(BackButton);
      await tester.tap(findBackButton);
      await tester.pumpAndSettle();
      await wait(2200);
    });
  });
}

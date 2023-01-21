import 'package:crud_mockio/generated/l10n.dart';
import 'package:crud_mockio/product/validator/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Validator", () {
    testWidgets("Validator Unit", (tester) async {
      await tester.pumpWidget(MaterialApp(
        locale: const Locale("en"),
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: S.delegate.supportedLocales,
        home: Builder(builder: (context) {
          // i need context ,so create widget test in unit test
          final validator = Validator.instance;
          final isEmptyValueTest = validator.isNotEmpty("", context);
          expect(isEmptyValueTest, null);

          final isNullTest = validator.isNotEmpty(null, context);
          expect(isNullTest, "This field is required");

          return const Placeholder();
        }),
      ));
    });
  });
}

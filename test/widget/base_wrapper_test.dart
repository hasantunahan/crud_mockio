import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const myValue = "myValue";
const titleValue = "titleValue";
void main() {
  group("Base Wrapper", () {
    testWidgets("BaseWrapper Widget", (tester) async {
      const baseWrapper = MaterialApp(
        home: BaseWrapper(
          title: Text(titleValue),
          child: Text(myValue),
        ),
      );

      await tester.pumpWidget(baseWrapper);

      final findMyValueText = find.text(myValue);
      expect(findMyValueText, findMyValueText);

      final findTitleValue = find.text(titleValue);
      expect(findTitleValue, findsOneWidget);

      final findSettingsButton = find.byType(GestureDetector);
      expect(findSettingsButton, findsOneWidget);

      const baseWrapperHideSettings = MaterialApp(
        home: BaseWrapper(
          hideSettings: true,
          title: Text(titleValue),
          child: Text(myValue),
        ),
      );

      await tester.pumpWidget(baseWrapperHideSettings);
      final findSettingsButton2 = find.byType(GestureDetector);
      expect(findSettingsButton2, findsNothing);
    });
  });
}

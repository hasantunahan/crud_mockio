// ignore_for_file: constant_identifier_names
import "dart:io";

import "package:flutter/cupertino.dart";
import "package:flutter/foundation.dart";
import "package:flutter/material.dart";

import "cupertino_date_picker.dart";

const int _MIN_YEAR_MINUS = 120;
const int _MAX_YEAR_PLUS = 200;

class CustomMaterialDatePicker {
  static Future<DateTime?> showPicker({
    required BuildContext context,
    required String closeText,
    required String selectText,
    Locale? locale,
    DateTime? initialDate,
  }) async {
    DateTime lastDate;
    DateTime firstDate;
    DateTime? selected;
    final DateTime now = DateTime.now();
    lastDate = DateTime(now.year + _MAX_YEAR_PLUS, now.month, now.day);
    firstDate = DateTime(now.year - _MIN_YEAR_MINUS);
    if (initialDate == null || initialDate.isAfter(lastDate) || initialDate.isBefore(firstDate)) {
      selected = now;
    } else {
      selected = initialDate;
    }

    if (!kIsWeb && Platform.isIOS) {
      DateTime? selectedDateTime;
      await showCupertinoModalPopup(
        context: context,
        builder: (context) {
          return CustomCupertinoDatePicker(
            onSelected: (dateTime) {
              selectedDateTime = dateTime;
            },
            initialDateTime: selected,
            maximumDate: lastDate,
            minimumDate: firstDate,
            closeText: closeText,
            selectText: selectText,
          );
        },
      );
      return selectedDateTime;
    } else {
      final DateTime? dateTime = await showDatePicker(
        context: context,
        firstDate: firstDate,
        initialDate: selected,
        lastDate: lastDate,
        locale: locale,
      );
      return dateTime;
    }
  }
}

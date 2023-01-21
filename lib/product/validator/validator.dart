import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

class Validator {
  Validator._init();
  static Validator? _instance;
  static Validator get instance {
    return _instance ??= Validator._init();
  }

  String? isNotEmpty(String? value, BuildContext context) {
    if (value == null) {
      return context.translate.required;
    } else if (value == "") {
      return context.translate.required;
    } else {
      return null;
    }
  }

  String? isTCKN(String? value, BuildContext context) {
    if (value == null) {
      return context.translate.required;
    } else if (value == "") {
      return context.translate.required;
    } else if (!_isTC(value)) {
      return context.translate.tckn_invalid;
    } else {
      return null;
    }
  }

  bool _isTC(String value) {
    if (value.length != 11 || (int.parse(value[0]) == 0)) {
      return false;
    } else {
      final num odd =
          int.parse(value[0]) + int.parse(value[2]) + int.parse(value[4]) + int.parse(value[6]) + int.parse(value[8]);
      final num even = int.parse(value[1]) + int.parse(value[3]) + int.parse(value[5]) + int.parse(value[7]);
      final num tc10 = ((odd * 7) - even) % 10;
      final num tc11 = (odd + even + int.parse(value[9])) % 10;
      if (tc10 == int.parse(value[9]) && tc11 == int.parse(value[10])) {
        return true;
      } else {
        return false;
      }
    }
  }
}

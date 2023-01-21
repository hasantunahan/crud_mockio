import 'package:crud_mockio/generated/l10n.dart';
import 'package:flutter/material.dart';

extension LanguageExtension on BuildContext {
  S get translate => S.of(this);
}

extension SizeExtension on BuildContext {
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}

extension ThemeExtension on BuildContext {
  ThemeData get theme => Theme.of(this);
}

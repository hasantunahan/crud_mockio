import 'package:crud_mockio/generated/l10n.dart';
import 'package:flutter/material.dart';

extension LanguageExtension on BuildContext {
  S get translate => S.of(this);
}

import 'package:flutter/material.dart';

class AppKey {
  AppKey._init();
  static AppKey? _instance;
  static AppKey get instance {
    return _instance ??= AppKey._init();
  }

  Key get addNewChef => const Key("addNewChef");
  Key get chefsListView => const Key("chefsListView");
  Key get settingsButton => const Key("settingsButton");
}

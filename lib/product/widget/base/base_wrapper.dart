import 'package:crud_mockio/product/config/environment/environment_preset.dart';
import 'package:crud_mockio/product/constant/app_key.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/widget/settings/settings_bottom_sheet.dart';
import 'package:flutter/material.dart';

class BaseWrapper extends StatelessWidget {
  final Widget child;
  final Widget? title;
  final bool hideSettings;
  const BaseWrapper({
    Key? key,
    required this.child,
    this.title,
    this.hideSettings = false,
  }) : super(key: key);

  void showSettings(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: context.theme.colorScheme.onSecondaryContainer,
      builder: (context) {
        return const SettingsBottomSheet();
      },
    );
  }

  Widget _renderSettings(BuildContext context) {
    return GestureDetector(
      key: AppKey.instance.settingsButton,
      onTap: () => showSettings(context),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _renderInfoText(String text, BuildContext context) {
    return Text(
      text,
      style: context.theme.textTheme.caption?.copyWith(
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (title != null) ...[
              title!,
              _renderInfoText(EnvironmentPreset.instance.config.applicationName, context),
              _renderInfoText(EnvironmentPreset.instance.config.versionName, context),
            ]
          ],
        ),
        centerTitle: false,
        actions: [
          if (!hideSettings) ...[_renderSettings(context)]
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: child,
      ),
    );
  }
}

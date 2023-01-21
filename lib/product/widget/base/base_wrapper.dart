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
      backgroundColor: context.theme.colorScheme.secondaryContainer,
      builder: (context) {
        return const SettingsBottomSheet();
      },
    );
  }

  Widget _renderSettings(BuildContext context) {
    return GestureDetector(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: title,
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

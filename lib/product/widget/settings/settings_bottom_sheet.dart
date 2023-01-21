import 'package:crud_mockio/product/constant/language.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/manager/provider/child/language_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsBottomSheet extends StatelessWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: context.width,
              child: Center(
                child: SizedBox(
                  width: context.width*.16,
                  child:  Divider(
                    color: context.theme.colorScheme.secondary,
                    thickness: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.translate),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  context.translate.language_chose,
                  style: context.theme.textTheme.subtitle1,
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Divider(),
            InkWell(
              onTap: () {
                context.read<LanguageProvider>().changeLocale(LanguageType.tr.value);
                // close bottom sheet
                Navigator.pop(context);
              },
              child: Text(context.translate.change_tr),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                // close bottom sheet
                Navigator.pop(context);
                context.read<LanguageProvider>().changeLocale(LanguageType.en.value);
              },
              child: Text(context.translate.change_en),
            ),
          ],
        ),
      ),
    );
  }
}

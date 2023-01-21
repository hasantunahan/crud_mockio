import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

import '../../../product/constant/assets.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.instance.png.splashView,
              width: context.width * .36,
              fit: BoxFit.cover,
            ),
            Text(
              context.translate.chef_management,
              style: context.theme.textTheme.headline6?.copyWith(
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
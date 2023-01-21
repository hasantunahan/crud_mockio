import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(context.translate.splash_view),
      ),
    );
  }
}

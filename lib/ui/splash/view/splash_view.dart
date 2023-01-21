import 'package:crud_mockio/injection.dart';
import 'package:crud_mockio/product/constant/assets.dart';
import 'package:crud_mockio/product/extension/context_extension.dart';
import 'package:crud_mockio/product/widget/base/base_wrapper.dart';
import 'package:crud_mockio/ui/splash/viewmodel/splash_viewmodel.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final viewModel = getIt<ISplashViewModel>();

  @override
  void initState() {
    super.initState();
    viewModel.init();
  }

  @override
  Widget build(BuildContext context) {
    return BaseWrapper(
      hideSettings: true,
      child: Center(
        child: Image.asset(
          Assets.instance.png.splashView,
          width: context.width * .36,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

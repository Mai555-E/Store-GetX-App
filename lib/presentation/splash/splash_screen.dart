import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../resources/app_assets.dart';

import '../resources/routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Change it properly
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    Future.delayed(const Duration(seconds: 3), () => {Get.offNamed(NamedRoutes.onboardingScreen), _restoreSystemUI()});

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: AlignmentDirectional.centerEnd, child: Image.asset(AppAssets.splashUpperCircleImage, width: 100)),
            Expanded(child: Image.asset(AppAssets.appLogo, width: 200)),
            Align(alignment: AlignmentDirectional.bottomStart, child: Image.asset(AppAssets.splashLowerCircleImage, width: 100))
          ],
        ),
      ),
    );
  }
}

void _restoreSystemUI() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: SystemUiOverlay.values);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
}

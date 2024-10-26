import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../resources/app_assets.dart';

import '../resources/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  @override
  void dispose() => {_timer.cancel(), super.dispose()};

  @override
  void initState() => {super.initState(), _startTimer()};

  void _navigateTo() => Get.toNamed(NamedRoutes.onboardingScreen);

  void _startTimer() => _timer = Timer(const Duration(seconds: 2), () => _navigateTo());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(alignment: AlignmentDirectional.centerEnd, child: Image.asset(AppAssets.upImage, width: 100)),
            Expanded(child: Image.asset(AppAssets.fashionImage, width: 200)),
            Align(alignment: AlignmentDirectional.bottomStart, child: Image.asset(AppAssets.halfCircleImage, width: 100))
          ],
        ),
      ),
    );
  }
}

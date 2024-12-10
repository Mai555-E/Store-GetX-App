import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/routes.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentIndex = 0;
  late final PageController _controller;

  @override
  void dispose() => {_controller.dispose(), super.dispose()};

  @override
  void initState() => {super.initState(), _controller = PageController()};

  void _goToPage(int index) {
    if (index == AppConstants.onboardingContent.length) Get.offNamed(NamedRoutes.signInScreen);
    _controller.animateToPage(index, duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: AppConstants.onboardingContent.length,
        itemBuilder: (_, index) => _buildOnboardingPage(index),
      ),
    );
  }

  Stack _buildOnboardingPage(int index) {
    final size = MediaQuery.sizeOf(context);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        const SizedBox.expand(child: Placeholder()),
        Container(
          width: size.width,
          height: size.height / 3,
          padding: const EdgeInsets.symmetric(vertical: AppConstants.padding, horizontal: AppConstants.padding / 2),
          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: Column(
            children: [
              Text(AppConstants.onboardingContent[index].title, textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),
              Text(AppConstants.onboardingContent[index].subtitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
              _buildNavigationRow()
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildNavigationRow() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [_buildPreviousButton(), _buildDots(), _buildNextButton()],
      ),
    );
  }

  Widget _buildPreviousButton() {
    return Visibility(
      visible: _currentIndex != 0,
      child: IconButton.outlined(onPressed: () => _goToPage(--_currentIndex), icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primary)),
    );
  }

  Widget _buildNextButton() {
    return IconButton.filled(
      iconSize: 20,
      onPressed: () => _goToPage(++_currentIndex),
      icon: const Icon(Icons.arrow_forward_rounded),
      style: IconButton.styleFrom(backgroundColor: AppColors.primary),
    );
  }

  Widget _buildDots() {
    return Row(
      children: List.generate(
        AppConstants.onboardingContent.length,
        (i) => SizedBox.square(
          dimension: _currentIndex == i ? 25 : 20,
          child: Container(
            margin: const EdgeInsets.all(AppConstants.padding / 5),
            decoration: BoxDecoration(shape: BoxShape.circle, color: _currentIndex == i ? AppColors.primary : Colors.grey),
          ),
        ),
      ),
    );
  }
}

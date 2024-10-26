import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../resources/routes.dart';

class OnboardingScreen extends StatelessWidget {
  static int _currentIndex = 0;

  static final PageController _controller = PageController();
  const OnboardingScreen({super.key});

  void _goNextPage() {
  

    if (++_currentIndex < 3) {
      _controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    } else {
      Get.toNamed(NamedRoutes.signInScreen);
    }
  }

  void _goPreviousPage() {
    --_currentIndex;
    _controller.previousPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: PageView.builder(
        controller: _controller,
        itemCount: AppConstants.onboardingContent.length,
        itemBuilder: (_, index) => Stack(
          children: [
            const SizedBox(height: 700, child: Placeholder()),
            Positioned(
              bottom: 0,
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(
                    children: [
                      // Title
                      Text(AppConstants.onboardingContent[index].title,
                          textAlign: TextAlign.center, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700)),
                      const SizedBox(height: 20),
                      Text(AppConstants.onboardingContent[index].subtitle,
                          textAlign: TextAlign.center, style: const TextStyle(fontSize: 17, color: Colors.grey)),
                      // Dots & Buttons
                      Expanded(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _currentIndex != 0
                                ? IconButton.outlined(
                                    onPressed: _goPreviousPage, icon: const Icon(Icons.arrow_back_rounded, color: AppColors.primary))
                                : const SizedBox.shrink(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20, left: 20),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  for (int i = 0; i < 3; ++i)
                                    SizedBox.square(
                                      dimension: _currentIndex == i ? 25 : 20,
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Container(
                                          decoration:
                                              BoxDecoration(color: _currentIndex == i ? AppColors.primary : Colors.grey, shape: BoxShape.circle),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            IconButton.filled(
                              iconSize: 20,
                              onPressed: _goNextPage,
                              icon: const Icon(Icons.arrow_forward_rounded),
                              style: IconButton.styleFrom(backgroundColor: AppColors.primary),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

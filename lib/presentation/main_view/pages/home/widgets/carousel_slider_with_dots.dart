import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_constants.dart';

class CarouselSliderWithDots extends StatelessWidget {
  final RxInt currentIndex;
  const CarouselSliderWithDots({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider.builder(
            itemCount: AppConstants.carouselSliderData.length,
            itemBuilder: (_, index, __) => _buildCarouselItem(AppConstants.carouselSliderData[index], context: context),
            options: CarouselOptions(height: 190, autoPlay: true, viewportFraction: 1, onPageChanged: (index, _) => currentIndex.value = index),
          ),
          Obx(() => Row(mainAxisAlignment: MainAxisAlignment.center, children: List.generate(AppConstants.carouselSliderData.length, _buildDot))),
        ],
      ),
    );
  }

  Widget _buildCarouselItem(CarouselData data, {required BuildContext context}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
      decoration: const BoxDecoration(color: Color(0xffe8dcd5), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            width: 200,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(data.title, style: Theme.of(context).textTheme.headlineMedium),
                Text(data.subTitle, style: Theme.of(context).textTheme.bodyMedium),
                SizedBox.fromSize(
                  size: const Size(130, 50),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                    child: Text("Show Now", textAlign: TextAlign.center, style: Theme.of(context).textTheme.labelLarge),
                  ),
                )
              ],
            ),
          ),
          Image.asset(data.images, fit: BoxFit.cover, height: 190)
        ],
      ),
    );
  }

  Container _buildDot(int index) {
    return Container(
      width: 10,
      height: 10,
      margin: const EdgeInsets.symmetric(horizontal: 3),
      decoration: BoxDecoration(shape: BoxShape.circle, color: currentIndex.value == index ? AppColors.primary : Colors.grey),
    );
  }
}

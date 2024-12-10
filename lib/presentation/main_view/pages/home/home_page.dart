import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

import '../../../resources/app_constants.dart';
import '../widgets/shareable_widget_main_view.dart';
import 'widgets/carousel_slider_with_dots.dart';
import 'widgets/category_list.dart';
import 'widgets/location_and_notification.dart';
import 'widgets/product_cards.dart';
import 'widgets/search_and_filter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static RxInt currentIndex = 0.obs;
  static String _location = AppConstants.locations.first;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderSection(),
            CarouselSliderWithDots(currentIndex: currentIndex),
            const CategoryList(),
            const TypesChips(chips: AppConstants.chips),
            const ProductCards()
          ],
        ),
      ),
    );
  }

  Padding _buildHeaderSection() {
    return Padding(
      padding: const EdgeInsets.all(AppConstants.padding),
      child: Column(
        children: [LocationAndNotification(location: _location, onLocationChanged: (location) => _location = location!), const SearchAndFilter()],
      ),
    );
  }
}

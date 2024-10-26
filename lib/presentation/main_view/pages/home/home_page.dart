import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../../../resources/app_assets.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';

class HomePage extends StatelessWidget {
  static RxInt currentIndex = 0.obs;
  static String _location = AppConstants.locations.first;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Location", style: TextStyle(color: Colors.grey)),
                  _buildLocationAndNotification(),
                  const SizedBox(height: 10),
                  _buildSearchAndFilter()
                ],
              ),
            ),
            _buildCarouselSliderWithDots(),
            _buildCategoryTitle(),
            _buildCategoriesList(),

            // Types Chips
            const TypesChips(),

            // Products
            _buildProductsCards()
          ],
        ),
      ),
    );
  }

  Row _buildLocationAndNotification() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Location Icon
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            const Icon(Icons.location_on, color: AppColors.primary),
            DropdownMenu(
              width: 220,
              menuHeight: 200,
              initialSelection: _location,
              onSelected: (selected) => _location = selected!,
              textStyle: const TextStyle(fontWeight: FontWeight.w500),
              trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
              inputDecorationTheme:
                  const InputDecorationTheme(border: InputBorder.none, enabledBorder: InputBorder.none, contentPadding: EdgeInsets.zero),
              dropdownMenuEntries: List.generate(AppConstants.locations.length,
                  (index) => DropdownMenuEntry(value: AppConstants.locations[index], label: AppConstants.locations[index])),
            ),
          ],
        ),

        // Notification Icon
        SizedBox.square(
          dimension: 40,
          child: IconButton.filled(
            iconSize: 25,
            onPressed: () {},
            color: AppColors.black,
            icon: const Icon(Icons.notifications_rounded),
            style: IconButton.styleFrom(backgroundColor: AppColors.white),
          ),
        )
      ],
    );
  }

  Row _buildSearchAndFilter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Search Bar
        const SizedBox(
          width: 295,
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search",
              prefixIconColor: AppColors.primary,
              prefixIcon: Icon(Icons.search_rounded),
              hintStyle: TextStyle(fontWeight: FontWeight.w400),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1))),
            ),
          ),
        ),
        // Search Filters
        Container(
          width: 45,
          height: 45,
          decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Icon(Icons.filter_alt_rounded, color: Colors.white),
        )
      ],
    );
  }

  SizedBox _buildCarouselSliderWithDots() {
    return SizedBox.fromSize(
      size: const Size.fromHeight(210), // CarouselSlider with Dots
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CarouselSlider.builder(
            itemCount: 5,
            itemBuilder: (_, index, __) {
              WidgetsBinding.instance.addPostFrameCallback((_) => currentIndex.value = index);
              return Column(
                children: [
                  Container(
                    height: 190, // CarouselSlider Height
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: const BoxDecoration(color: Color(0xffe8dcd5), borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(30),
                          child: SizedBox(
                            width: 145,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // Title
                                Text(AppConstants.carouselSliderData[index].title,
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                                // SubTitle
                                Text(AppConstants.carouselSliderData[index].subTitle,
                                    style: TextStyle(fontSize: 15, color: Colors.grey[700])),
                                // Button
                                SizedBox.fromSize(
                                  size: const Size(110, 30),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10)))),
                                    child: const Text("Show Now", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Image.asset(AppConstants.carouselSliderData[index].images, fit: BoxFit.cover, width: 120, height: 190)
                      ],
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
                height: 190,
                autoPlay: true,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                autoPlayCurve: Curves.easeInOutCubicEmphasized),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => Obx(
                () => Container(
                  width: 10,
                  height: 10,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  decoration: BoxDecoration(shape: BoxShape.circle, color: currentIndex.value == index ? AppColors.primary : Colors.grey),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Padding _buildCategoryTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Category", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500)),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(alignment: Alignment.centerRight, textStyle: const TextStyle(decoration: TextDecoration.none)),
            child: const Text("See All", style: TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }

  SizedBox _buildCategoriesList() {
    return SizedBox.fromSize(
      size: const Size.fromHeight(90),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.categoryIcons.length,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        separatorBuilder: (_, __) => const SizedBox(width: 25),
        itemBuilder: (_, index) => Column(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xfff8f2ed),
              child: Image.asset(AppConstants.categoryIcons[index].image, fit: BoxFit.contain, width: 35, color: AppColors.primary),
            ),
            Text(AppConstants.categoryIcons[index].name, style: const TextStyle(fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }

  SizedBox _buildProductsCards() {
    return SizedBox.fromSize(
      size: const Size.fromHeight(500),
      child: GridView.builder(
        itemCount: 4,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: .86, mainAxisSpacing: 10, crossAxisSpacing: 15),
        itemBuilder: (_, __) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Image
            Container(
              width: 180,
              height: 147,
              decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Image.asset(AppAssets.jacket, fit: BoxFit.fitHeight),
            ),

            // Product Name & Score
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text("Brown jacket"), Text("\u{2B50} 4.9", style: TextStyle(color: Colors.grey))],
            ),

            // Price
            const Text("\$83.97")
          ],
        ),
      ),
    );
  }
}

class TypesChips extends StatefulWidget {
  static int selectedChipIndex = 0;
  const TypesChips({super.key});

  @override
  State<TypesChips> createState() => _TypesChipsState();
}

class _TypesChipsState extends State<TypesChips> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: SizedBox.fromSize(
        size: const Size.fromHeight(50),
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: AppConstants.chips.length,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (_, index) => ChoiceChip(
            label: Text(AppConstants.chips[index]),
            selected: TypesChips.selectedChipIndex == index,
            onSelected: (selected) => setState(() => TypesChips.selectedChipIndex = index),
            labelStyle: TextStyle(color: TypesChips.selectedChipIndex == index ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}

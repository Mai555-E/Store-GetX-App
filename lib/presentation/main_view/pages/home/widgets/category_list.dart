import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_constants.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [_buildCategoryTitle(context), _buildCategoryList()],
    );
  }

  Padding _buildCategoryTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Category", style: Theme.of(context).textTheme.headlineSmall),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(alignment: Alignment.centerRight),
            child: const Text("See All", style: TextStyle(fontSize: 15)),
          )
        ],
      ),
    );
  }

  SizedBox _buildCategoryList() {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: AppConstants.categoryIcons.length,
        separatorBuilder: (_, __) => const SizedBox(width: 25),
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
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
}

import 'package:flutter/material.dart';

import '../../../../resources/app_assets.dart';
import '../../../../resources/app_colors.dart';
import '../../../../resources/app_constants.dart';

class ProductCards extends StatelessWidget {
  const ProductCards({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: GridView.builder(
        itemCount: 4,
        itemBuilder: (_, __) => _buildProductCard(),
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: .86, mainAxisSpacing: 10, crossAxisSpacing: 15),
      ),
    );
  }

  Widget _buildProductCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 180,
          height: 147,
          decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(10))),
          child: Image.asset(AppAssets.womanModelImage, fit: BoxFit.fitHeight),
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [Text("Brown jacket"), Text("\u{2B50} 4.9", style: TextStyle(color: Colors.grey))],
        ),
        const Text("\$83.97")
      ],
    );
  }
}

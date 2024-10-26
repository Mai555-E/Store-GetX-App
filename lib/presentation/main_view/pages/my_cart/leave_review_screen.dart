import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';
import 'my_orders.dart';

class LeaveReviewScreen extends StatelessWidget {
  const LeaveReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Leave Review",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
      backgroundColor: const Color(0xffffffff),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    MyOrderCard(
                        title: "Re-Order",
                        order: Order(
                            product: Product(
                                id: 2, size: "XL", price: 56.879, title: "Brown jacket", image: AppAssets.girlJacket, description: ""))),
                    Divider(color: Colors.grey[300]),
                    const SizedBox(
                        height: 55, child: Text("How is your order?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600))),
                    Divider(color: Colors.grey[300]),
                    const Padding(padding: EdgeInsets.symmetric(vertical: 10), child: Text("Your overall rating")),
                    const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10), child: CustomRatingBar()),
                    Divider(color: Colors.grey[300]),
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("Add detailed review", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))),
                    Container(
                        height: 140,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColors.secondary), borderRadius: const BorderRadius.all(Radius.circular(20))),
                        child: TextFormField(
                            enabled: false,
                            keyboardAppearance: Brightness.light,
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(hintText: "Enter here", hintMaxLines: 8))),
                    Align(
                        alignment: Alignment.topLeft,
                        child: TextButton.icon(
                            onPressed: () {},
                            label: const Text("add photo", style: TextStyle(decoration: TextDecoration.none, fontSize: 17)),
                            icon: const Icon(Icons.camera_alt_outlined))),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(width: 140, child: ElevatedButton(onPressed: () {}, child: const Text("Cancel"))),
                    SizedBox(width: 140, child: ElevatedButton(onPressed: () {}, child: const Text("submit")))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomRatingBar extends StatefulWidget {
  const CustomRatingBar({super.key});

  @override
  State<CustomRatingBar> createState() => _CustomRatingBarState();
}

class _CustomRatingBarState extends State<CustomRatingBar> {
  double initialValue = 0;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
        itemBuilder: (context, _) => const Icon(Icons.star, color: Colors.amber),
        onRatingUpdate: (val) {
          setState(() => initialValue = val);
        },
        direction: Axis.horizontal,
        initialRating: initialValue,
        itemCount: 5,
        minRating: 1,
        glowRadius: BorderSide.strokeAlignCenter,
        allowHalfRating: true);
  }
}

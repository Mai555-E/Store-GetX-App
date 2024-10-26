import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';
import '../../../widgets/leading_app_bar.dart';
import 'payment_methods_screen.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const LeadingAppBar(title: "Coupon"), // style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomText(title: "Best offer for you"),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                scrollDirection: Axis.vertical,
                separatorBuilder: (_, __) => const SizedBox(height: 8),
                itemBuilder: (_, index) => RepeatedCouponText(
                  header: AppConstants.couponDetails[index].header,
                  content: AppConstants.couponDetails[index].content,
                  discount: AppConstants.couponDetails[index].discount,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RepeatedCouponText extends StatelessWidget {
  final String header, content, discount;
  const RepeatedCouponText({super.key, required this.header, required this.content, required this.discount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: double.maxFinite,
          height: MediaQuery.sizeOf(context).height / 4,
          margin: const EdgeInsets.only(top: 10, right: 8, left: 8),
          decoration: BoxDecoration(border: Border.all(color: AppColors.grey), borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(header, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                    Text(content, style: const TextStyle(color: AppColors.grey)),
                    Row(
                      children: [
                        const Icon(Icons.discount_rounded),
                        Text(discount, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
                      ],
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 70,
                  width: double.maxFinite,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(color: Color(0xfff6f6f6)),
                  child: const Text("COPY CODE", textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400)),
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border(left: BorderSide())),
          ),
        ),
        Positioned(
          left: 0,
          child: Container(
            width: 30,
            height: 30,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle, border: Border(right: BorderSide())),
          ),
        ),
      ],
    );
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../../../resources/app_assets.dart';
import '../../../resources/app_colors.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  static DateTime time = DateTime.now();
  static String format = DateFormat("dd MMMM yyyy").format(time);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Receipt")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(children: [
          const Placeholder(fallbackHeight: 90, strokeWidth: double.minPositive),
          Divider(color: Colors.grey[300]),
          CustomReceiptOrderCard(
              order: Order(
                  product: Product(
                      id: 5, size: "XL | Qty : 10pcs", price: 120, title: "brown Jacket", image: AppAssets.girlJacketImage, description: ""))),
          Divider(color: Colors.grey[300]),
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 4.3,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const TextAndTrailing("Amount", "\$120"),
                const TextAndTrailing("Delivery Charge", "\$100"),
                const TextAndTrailing("Promo", "-\$31.50"),
                Divider(color: Colors.grey[200]),
                const TextAndTrailing("Total", "\$88.50")
              ])),
          Divider(color: Colors.grey[300]),
          SizedBox(
              height: MediaQuery.sizeOf(context).height / 5.4,
              child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                const TextAndTrailing("Payment method", "Cash"),
                TextAndTrailing("Date", "$format, ${DateFormat.jm().format(time)}"),
                const TextAndTrailing("Transaction ID", "TrrTTTFDGE")
              ])),
          const Spacer(),
          ElevatedButton(onPressed: () {}, child: const Text("Download E-Receipt"))
        ]),
      ),
    );
  }
}

class TextAndTrailing extends StatelessWidget {
  final String title;
  final dynamic trailing;

  const TextAndTrailing(this.title, this.trailing, {super.key, this.fontSize = 17});

  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: fontSize, color: AppColors.secondary, fontWeight: FontWeight.w500)),
        Text(trailing.toString(), style: TextStyle(fontSize: fontSize - 3, fontWeight: FontWeight.w500))
      ],
    );
  }
}

class CustomReceiptOrderCard extends StatelessWidget {
  final Order order;
  const CustomReceiptOrderCard({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      SizedBox.square(
          dimension: 90,
          child: DecoratedBox(
              decoration:
                  const BoxDecoration(shape: BoxShape.rectangle, color: Color(0xffeee5db), borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Image.asset(order.product.image))),
      Expanded(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 0, 15),
              child: Row(crossAxisAlignment: CrossAxisAlignment.end, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(order.product.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                    Text(order.product.size, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                    Text("\$${order.product.price}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                  ],
                )
              ])))
    ]);
  }
}

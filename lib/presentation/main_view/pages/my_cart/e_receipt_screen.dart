import 'package:flutter/material.dart';
import 'package:store_getx_app/app/app.dart';
import 'package:store_getx_app/domain/order.dart';
import 'package:store_getx_app/domain/product.dart';
import 'package:store_getx_app/presentation/main_view/pages/widgets/order_card.dart';
import 'package:store_getx_app/presentation/resources/app_assets.dart';
import 'package:store_getx_app/presentation/resources/app_colors.dart';

class ReceiptScreen extends StatelessWidget {
  const ReceiptScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("E-Receipt")),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            const Placeholder(fallbackHeight: 90, strokeWidth: double.minPositive),
            Divider(color: Colors.grey[300]),
            CustomReceiptOrderCard(
                order: Order(
                    product: Product(
                        id: 5, size: "XL | tQ : 10pcs", price: 120, title: "brown Jacket", image: AppAssets.girlJacket, description: ""))),
            Divider(color: Colors.grey[300]),
            SizedBox(
                height: MediaQuery.sizeOf(context).height / 4.3,
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const RepeatedTextAndPrice(title: "Amount", price: 120),
                  const RepeatedTextAndPrice(title: "Delivery Charge", price: 100),
                  const RepeatedTextAndPrice(title: "Promo", price: 31.50, sign: "-"),
                  Divider(color: Colors.grey[200]),
                  const RepeatedTextAndPrice(title: "Total", price: 88.50, sign: "-")
                ])),
            Divider(color: Colors.grey[300]),
            SizedBox(
                height: MediaQuery.sizeOf(context).height / 5.4,
                child: const Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  RepeatedTextAndPrice(title: "Amount", price: 120),
                  RepeatedTextAndPrice(title: "Delivery Charge", price: 100),
                  RepeatedTextAndPrice(title: "Promo", price: 31.50, sign: "-")
                ])),
            const Spacer(),
            ElevatedButton(onPressed: () {}, child: const Text("DownLoad E-receipt"))
          ],
        ),
      ),
    );
  }
}

class RepeatedTextAndPrice extends StatelessWidget {
  final String title;
  final double price;
  final String sign;
  const RepeatedTextAndPrice({
    super.key,
    required this.title,
    required this.price,
    this.sign = "",
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: const TextStyle(fontSize: 18, color: AppColors.secondary, fontWeight: FontWeight.w500)),
        Text("$sign\$$price", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500))
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
              decoration: const BoxDecoration(
                  shape: BoxShape.rectangle, color: Color(0xffeee5db), borderRadius: BorderRadius.all(Radius.circular(15))),
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

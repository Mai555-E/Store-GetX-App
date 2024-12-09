import 'package:flutter/material.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../../../resources/app_assets.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Orders", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
          bottom: const TabBar(indicatorColor: Color(0xff704f38), tabs: [
            Tab(icon: Text("Active", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff704f38)))),
            Tab(icon: Text("Completed", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17, color: Color(0xff704f38)))),
            Tab(icon: Text("Cancelled", style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18, color: Color(0xff704f38))))
          ]),
        ),
        body: TabBarView(children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                MyOrderCard(
                    title: 'Track Order',
                    order: Order(
                        product: Product(id: 5, size: "XL", price: 83.97, title: "Brown jacket", image: AppAssets.girlJacketImage, description: "")))
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              child: Column(children: [
                MyOrderCard(
                    title: 'Leave-Review',
                    order: Order(
                        product: Product(id: 4, size: "XL", price: 83.97, title: "Brown jacket", image: AppAssets.girlJacketImage, description: "")))
              ])),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(children: [
                MyOrderCard(
                    title: 'Re-Order',
                    order:
                        Order(product: Product(id: 3, size: "XL", price: 83.97, title: "Brown jacket", image: AppAssets.girlJacketImage, description: "")))
              ])),
        ]),
      ),
    );
  }
}

class MyOrderCard extends StatelessWidget {
  final Order order;
  final String? title;
  const MyOrderCard({super.key, required this.title, required this.order});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox.square(
            dimension: 90,
            child: DecoratedBox(
                decoration:
                    const BoxDecoration(shape: BoxShape.rectangle, color: Color(0xffeee5db), borderRadius: BorderRadius.all(Radius.circular(15))),
                child: Image.asset(order.product.image))),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 0, 5),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(order.product.title, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  Text("Size: ${order.product.size} | Qty :10pcs", style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
                  Text("\$${order.product.price}", style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500))
                ]),
                Visibility(
                    visible: (title != "") ? true : false,
                    child: SizedBox(
                        width: 95,
                        height: 40,
                        child: ElevatedButton(
                            onPressed: () {},
                            style:
                                ElevatedButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 6), backgroundColor: const Color(0xff704f38)),
                            child: Text(title!, style: const TextStyle(color: Colors.white, fontSize: 15)))))
              ],
            ),
          ),
        )
      ],
    );
  }
}

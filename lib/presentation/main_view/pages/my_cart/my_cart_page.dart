import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_getx_app/presentation/resources/app_constants.dart';
import 'package:store_getx_app/presentation/resources/routes.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../widgets/order_card.dart';

class MyCartPage extends StatelessWidget {
  final List<Order> orders;
  const MyCartPage({super.key, required this.orders}); // ,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("My Cart", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.sizeOf(context).height / 2.2,
                child: ListView.separated(
                    itemCount: 10, // TODO: orders.length
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    separatorBuilder: (_, __) => const Column(children: [SizedBox(height: 10), Divider(), SizedBox(height: 10)]),
                    itemBuilder: (_, index) => OrderCard(
                        
                        order: Order(
                            quantity: 1,
                            product: Product(
                                id: index+1,
                                price: 83.97,
                                description: "",
                                size: "Size : XL",
                                title: "Brown Jacket",
                                image: "assets/images/girl_jacket.png"))))),
            const ShowModelBottomSheet()
          ],
        ),
      ),
    );
  }
}

class ShowModelBottomSheet extends StatelessWidget {
  const ShowModelBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.sizeOf(context).height / 2.4,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
        child: Column(
          children: [
            TextField(decoration: InputDecoration(hintText: "Promo Code", hintStyle: TextStyle(color: Colors.grey[600], fontSize: 17))),
            const SizedBox(height: 15),
            Expanded(
              child: ListView.separated(
                  itemCount: 3,
                  scrollDirection: Axis.vertical,
                  separatorBuilder: (_, __) => const SizedBox(height: 8),
                  itemBuilder: (_, index) => Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                        Text(AppConstants.showModelBottomSheetDetails[index].hintText,
                            style: TextStyle(color: Colors.grey[600], fontSize: 16)),
                        Text("\$${AppConstants.showModelBottomSheetDetails[index].price}", style: const TextStyle(color: Colors.black))
                      ])),
            ),
            const Divider(),
            const SizedBox(height: 8),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text("Total Cost", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
              const Text("\$397.897", style: TextStyle(color: Colors.black))
            ]),
            const SizedBox(height: 10),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child:
                      ElevatedButton(onPressed: () => Get.toNamed(NamedRoutes.checkoutScreen), child: const Text('Proceed to checkout'))),
            ),
          ],
        ),
      ),
    );
  }
}

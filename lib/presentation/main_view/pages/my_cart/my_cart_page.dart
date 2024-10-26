import 'package:flutter/material.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../widgets/order_card.dart';

class MyCartPage extends StatelessWidget {
  // final List<Order> orders;
  const MyCartPage({super.key}); // , required this.orders

  // TODO: This Shouldn't be here
  // static final List<({String hintText, String price})> _showModelBottomSheetDetails = [
  //   (hintText: "Sub-Total", price: "407.085"),
  //   (hintText: "Delivery fee", price: "25.056"),
  //   (hintText: "Discount", price: "35")
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("My Cart", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: ListView.separated(
        itemCount: 10, // TODO: orders.length
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        separatorBuilder: (_, __) => const Column(children: [SizedBox(height: 10), Divider(), SizedBox(height: 10)]),
        itemBuilder: (_, index) => OrderCard(
          // TODO: order[index]
          order: Order(
            quantity: 1,
            product: Product(id: 0, price: 83.97, description: "", size: "Size : XL", title: "Brown Jacket", image: "assets/images/girl_jacket.png"),
          ),
        ),
      ),

      // ? TODO: Why You Put it Like That
      // ? as a button in the bottom of the screen, is it in the design ?!
      //     ElevatedButton(
      //   child: const Text('show Bottom Sheet', style: TextStyle(color: Colors.white, fontSize: 20)),
      //   onPressed: () => showModalBottomSheet(
      //     context: context,
      //     builder: (_) => Container(
      //       padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
      //       decoration: const BoxDecoration(borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
      //       child: Column(
      //         children: [
      //           TextField(decoration: InputDecoration(hintText: "Promo Code", hintStyle: TextStyle(color: Colors.grey[600], fontSize: 17))),
      //           const SizedBox(height: 15),
      //           SizedBox(
      //             height: 100, // TODO: Must Take All Space between TextFormField & Bottom Button
      //             child: ListView.separated(
      //               itemCount: 3,
      //               scrollDirection: Axis.vertical,
      //               separatorBuilder: (_, __) => const SizedBox(height: 8),
      //               itemBuilder: (_, index) => Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: [
      //                   Text(_showModelBottomSheetDetails[index].hintText, style: TextStyle(color: Colors.grey[600], fontSize: 16)),
      //                   Text("\$${_showModelBottomSheetDetails[index].price}", style: const TextStyle(color: Colors.black)),
      //                 ],
      //               ),
      //             ),
      //           ),
      //           const Divider(),
      //           const SizedBox(height: 8),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: [
      //               Text("Total Cost", style: TextStyle(color: Colors.grey[600], fontSize: 16)),
      //               const Text("\$397.897", style: TextStyle(color: Colors.black)),
      //             ],
      //           ),
      //           const SizedBox(height: 12),
      //           Expanded(
      //             child: Align(
      //               alignment: Alignment.bottomCenter, // TODO: Navigate to Checkout Screen
      //               child: ElevatedButton(onPressed: () => Navigator.pop(context), child: const Text('Proceed to checkout')),
      //             ),
      //           ),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

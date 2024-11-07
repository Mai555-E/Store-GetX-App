import 'package:flutter/material.dart';

import '../../../../domain/order.dart';
import '../../../../domain/product.dart';
import '../../../resources/app_colors.dart';
import '../widgets/order_card.dart';
import 'shopping_address_screen.dart';

class CheckoutScreen extends StatelessWidget {
  final List<Order> orders;

  const CheckoutScreen({super.key, required this.orders}); // required this.orders

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.white, title: const Text("Checkout", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const LocationView(
                addressType: "Home",
                header: "Shipping Address",
                icon: Icons.location_on_outlined,
                location: '456 Market SLos Angeles, CA 90015'),
            const Divider(color: Color.fromARGB(255, 185, 179, 179)),
            const LocationView(
                addressType: "Economy",
                header: "Choose Shipping type",
                icon: Icons.location_on_outlined,
                location: "Estimated arrival time 25 May 2025"),

            const Divider(color: Color.fromARGB(255, 185, 179, 179)),
            const Text("Order List", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),

            SizedBox(
              height: MediaQuery.sizeOf(context).height / 2.5,
              child: Expanded(
                child: ListView.separated(
                    itemCount: 3, // TODO order length
                    padding: const EdgeInsets.fromLTRB(20, 0, 14, 20),
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (_, __) => OrderCard(
                        order: Order(
                            quantity: 1,
                            product: Product(
                                id: 0,
                                price: 83.97,
                                description: "",
                                size: "Size : XL",
                                title: "Brown Jacket",
                                image: "assets/images/girl_jacket.png")))),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Continue to Payment"))
          ],
        ),
      ),
    );
  }
}

class LocationView extends StatelessWidget {
  final String header;
  final IconData icon;
  final String location;
  final String addressType;
  const LocationView({super.key, required this.icon, required this.header, required this.location, required this.addressType});

  @override
  Widget build(BuildContext context) {
    return SizedBox.fromSize(
      size: const Size.fromHeight(120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(header, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
          const SizedBox(height: 18),
          RepeatedAddress(address: addressType, icon: icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location, style: const TextStyle(color: Color(0xffb0aeaf), fontWeight: FontWeight.w500)),
              OutlinedButton(
                  onPressed: () {},
                  style: const ButtonStyle(
                      side: WidgetStatePropertyAll(BorderSide(color: Colors.grey)),
                      padding: WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 10))),
                  child: const Text("CHANGE", style: TextStyle(color: AppColors.primary)))
            ],
          )
        ],
      ),
    );
  }
}

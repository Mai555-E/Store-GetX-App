import 'package:flutter/material.dart';
import '../../../resources/app_constants.dart';

import 'shopping_address_screen.dart';

class ChooseShippingScreen extends StatefulWidget {
  const ChooseShippingScreen({super.key});

  @override
  State<ChooseShippingScreen> createState() => _ShippingScreenState();
}

class _ShippingScreenState extends State<ChooseShippingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar:
          AppBar(backgroundColor: Colors.white, title: const Text("Choose Shipping", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: SizedBox(
              width: double.maxFinite,
              height: MediaQuery.of(context).size.height / 1.7,
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (_, index) => ShippingView(
                  icon: AppConstants.shippingCategories[index].icon,
                  location: AppConstants.shippingCategories[index].location,
                  addressType: AppConstants.shippingCategories[index].address,
                ),
              ),
            ),
          ),
          Expanded(child: Align(alignment: Alignment.bottomCenter, child: ElevatedButton(onPressed: () {}, child: const Text("Apply"))))
        ],
      ),
    );
  }
}

class ShippingView extends StatelessWidget {
  final IconData icon;
  final String location;
  final String addressType;
  static late String value;
  const ShippingView({super.key, required this.icon, required this.location, required this.addressType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 98,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RepeatedAddress(address: addressType, icon: icon),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(location, style: const TextStyle(color: Color(0xffb0aeaf), fontWeight: FontWeight.w500)),
              Radio(value: "economy", groupValue: value, onChanged: (val) => value = val!)
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}

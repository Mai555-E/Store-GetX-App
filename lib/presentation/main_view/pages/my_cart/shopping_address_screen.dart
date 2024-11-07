import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class ShoppingAddressScreen extends StatelessWidget {
  const ShoppingAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Shopping Address", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w700))),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child: SizedBox(
                height: size.height / 1.4,
                child: const Column(children: [
                  RepeatedAddress(address: "Home", icon: Icons.location_on_outlined),
                  // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("456 Market SLos Angeles, CA 90015", style: TextStyle(color: Color(0xffb0aeaf)))],
                  ),
                  SizedBox(height: 10),
                  Divider()
                ])),
          ),
          ElevatedButton(onPressed: () {}, child: const Text("Apply"))
        ],
      ),
    );
  }
}

class RepeatedAddress extends StatelessWidget {
  final Color iconColor;
  final IconData icon;
  final String address;
  final Color color;
  const RepeatedAddress(
      {super.key, required this.address, required this.icon, this.color = Colors.black, this.iconColor = AppColors.primary});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 27, color: iconColor),
        const SizedBox(width: 3),
        Text(address, style: TextStyle(fontSize: 18, color: color))
      ],
    );
  }
}

class CustomToggleButton extends StatefulWidget {
  const CustomToggleButton({super.key});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  bool isSelected = false;
  List<bool> value = [false];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 52,
        height: 32,
        child: ToggleButtons(
            borderWidth: 2,
            isSelected: value,
            color: Colors.white,
            borderColor: const Color(0xff704f38),
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            onPressed: (index) => setState(() {
                  value[index] = !value[index];
                  isSelected = value[index];
                }),
            children: [Icon(Icons.circle, size: 20, color: (isSelected) ? const Color(0xff704f38) : Colors.white)]));
  }
}

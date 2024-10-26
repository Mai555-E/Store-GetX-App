import 'package:flutter/material.dart';
import '../../../resources/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Payment", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  child: Container(
                    width: 110,
                    height: 110,
                    margin: const EdgeInsets.only(bottom: 15),
                    decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                    child: const Icon(Icons.check, size: 70, color: Colors.white),
                  ),
                ),
                const Text("Payment Successful!", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500)),
                const Padding(
                  padding: EdgeInsets.only(top: 13),
                  child: Text("Thank you for your purchase.", style: TextStyle(color: AppColors.secondary)),
                ),
              ],
            ),
          ),
          const CustomPaymentButton(title: "View Order")
        ],
      ),
    );
  }
}

class CustomPaymentButton extends StatelessWidget {
  final String title;
  const CustomPaymentButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 110,
          width: double.infinity,
          padding: const EdgeInsets.only(top: 15, left: 10, right: 10, bottom: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(15)),
              boxShadow: [BoxShadow(blurRadius: 10, spreadRadius: 2, offset: const Offset(0, 3), color: Colors.black.withOpacity(.3))]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                  child: ElevatedButton(onPressed: () {}, style: ElevatedButton.styleFrom(fixedSize: const Size.fromWidth(250)), child: Text(title))),
              const Text("View E-Receipt", style: TextStyle(color: AppColors.primary, fontSize: 17))
            ],
          ),
        ),
      ),
    );
  }
}

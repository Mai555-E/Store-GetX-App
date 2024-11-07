import 'package:flutter/material.dart';
import 'shopping_address_screen.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethodsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.white, title: const Text("Choose Shipping", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomText(title: "Credit & Debit Card"),
                Container(
                  margin: const EdgeInsets.only(top: 10, bottom: 25),
                  width: double.maxFinite,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(15)), border: Border.all(color: const Color(0xffE0E0E0))),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                    const RepeatedAddress(address: "Add Card", icon: Icons.card_travel_rounded, color: Color.fromRGBO(66, 66, 66, 1)),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_forward_ios_outlined, color: AppColors.primary))
                  ]),
                ),
                const CustomText(title: "More Payment Option"),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  height: MediaQuery.sizeOf(context).height / 3.7,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(20)), border: Border.all(color: const Color(0xffE0E0E0))),
                  child: Column(
                    children: [
                      Expanded(
                          child: ListView.separated(
                              itemCount: 3,
                              separatorBuilder: (_, __) => const Divider(),
                              itemBuilder: (BuildContext context, index) => CustomRadioButton(
                                  title: AppConstants.paymentOption[index].title, imageValue: AppConstants.paymentOption[index].image)))
                    ],
                  ),
                )
              ],
            ),
          ),
          Expanded(
              child:
                  Align(alignment: Alignment.bottomCenter, child: ElevatedButton(onPressed: () {}, child: const Text("Confirm Payment"))))
        ],
      ),
    );
  }
}

class PaymentIcon extends StatelessWidget {
  final String image;
  final String payTitle;
  const PaymentIcon({super.key, required this.image, required this.payTitle});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(image, width: 30, height: 35),
        const SizedBox(width: 8),
        Text(payTitle, style: TextStyle(color: Colors.grey[600], fontSize: 18))
      ],
    );
  }
}

class CustomText extends StatelessWidget {
  final String title;
  const CustomText({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(title, style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w600));
  }
}

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({super.key, required this.imageValue, required this.title});

  final String imageValue;
  final String title;
  static String? radioValue;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PaymentIcon(payTitle: title, image: imageValue),
        Radio(
          value: title,
          groupValue: radioValue,
          onChanged: (val) {
            radioValue = val;
          },
        )
      ],
    );
  }
}

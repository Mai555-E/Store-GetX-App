import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class VisaCardScreen extends StatelessWidget {
  const VisaCardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Add Card", style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              const VisaCard(),
              const CardTextFormField(),
              ElevatedButton(onPressed: () {}, child: const Text("Add Card"))
            ]
          ),
        ),
      ),
    );
  }
}

class CardTextFormField extends StatelessWidget {
  const CardTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height / 2.3,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Spacer(),
          TextFormField(decoration: const InputDecoration(label: Text("Card Holder Name"))),
          const Spacer(),
          TextFormField(decoration: const InputDecoration(label: Text("Card Number"))),
          const Spacer(),
          Row(
            children: [
              Flexible(flex: 3, child: TextFormField(decoration: const InputDecoration(label: Text("Expiry Date")))),
              const SizedBox(width: 25),
              Flexible(flex: 3, child: TextFormField(decoration: const InputDecoration(label: Text("CVV"))))
            ],
          ),
          const CheckedButton()
        ],
      ),
    );
  }
}

class VisaCard extends StatelessWidget {
  const VisaCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height / 4,
      decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(15))),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Align(alignment: Alignment.topRight, child: Text("VISA", style: TextStyle(color: AppColors.white, fontSize: 20))),
          Spacer(flex: 3),
          Text("1235678985236", style: TextStyle(color: AppColors.white, fontSize: 25)),
          Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Card holder name", style: TextStyle(color: Color(0xffd7ccc4), fontSize: 15)),
              Text("Expiry date", style: TextStyle(color: Color(0xffd7ccc4), fontSize: 15)),
              Align(alignment: Alignment.centerRight, child: Icon(Icons.sd_card, size: 40, color: Colors.white))
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Mai Emad", style: TextStyle(color: Color(0xffd7ccc4), fontSize: 15)),
              Text("02\\30", style: TextStyle(color: Color(0xffd7ccc4), fontSize: 15))
            ],
          ),
        ],
      ),
    );
  }
}

class CheckedButton extends StatefulWidget {
  const CheckedButton({super.key});

  @override
  State<CheckedButton> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<CheckedButton> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isChecked,
          activeColor: AppColors.primary,
          onChanged: (isChecked) => setState(() => _isChecked = isChecked!),
        ),
        Text("Save Card", style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }
}

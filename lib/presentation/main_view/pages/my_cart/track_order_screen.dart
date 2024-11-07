import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_getx_app/domain/order.dart';
import 'package:store_getx_app/domain/product.dart';
import 'package:store_getx_app/presentation/main_view/pages/my_cart/e_receipt_screen.dart';
import 'package:store_getx_app/presentation/main_view/pages/my_cart/my_orders.dart';
import 'package:store_getx_app/presentation/resources/app_colors.dart';
import 'package:store_getx_app/presentation/widgets/leading_app_bar.dart';

import '../../../resources/app_assets.dart';

class TrackOrderScreen extends StatelessWidget {
  const TrackOrderScreen({super.key});

  static DateTime time = DateTime.now();
  static String format = DateFormat("dd MMMM yyyy").format(time);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LeadingAppBar(title: "Track Order"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyOrderCard(
                title: "",
                order: Order(
                    product:
                        Product(id: 2, size: "XL", price: 56.879, title: "Brown jacket", image: AppAssets.girlJacket, description: ""))),
            Divider(color: Colors.grey[300]),
            Container(
                height: MediaQuery.sizeOf(context).height / 6.9,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  const Text("Order Details", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 21)),
                  TextAndTrailing("Expected Delivery Date", format, fontSize: 17),
                  const TextAndTrailing("Tracking ID", "TTTRMKGGHF", fontSize: 18)
                ])),
            Divider(color: Colors.grey[300]),
            const CustomStepper()
          ],
        ),
      ),
    );
  }
}

class CustomStepper extends StatefulWidget {
  const CustomStepper({super.key});

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      //height: MediaQuery.sizeOf(context).height / 2,
      child: Stepper(
          onStepCancel: () => setState(() {
                if (currentIndex > 0) currentIndex -= 1;
              }),
          onStepContinue: () => setState(() {
                if (currentIndex < 4) currentIndex += 1;
              }),
          onStepTapped: (value) => setState(() {
                currentIndex = value;
              }),
          elevation: 0,
          margin: const EdgeInsets.only(top: 20),
          steps: [
            _buildStep(Icons.event_note_rounded, "Order Place", currentIndex,
                "${DateFormat("dd MMMM yyyy").format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}", 0),
            _buildStep(Icons.view_in_ar, "In Progress", currentIndex,
                "${DateFormat("dd MMMM yyyy").format(DateTime.now())}, ${DateFormat.jm().format(DateTime.now())}", 1),
            _buildStep(
                Icons.local_shipping_outlined, "Shipped", currentIndex, "Expected ${DateFormat("dd MMMM yyyy").format(DateTime.now())}", 2),
            _buildStep(Icons.view_in_ar, "Delivered", currentIndex, DateFormat("dd MMMM yyyy").format(DateTime.now()), 3)
          ]),
    );
  }
}

Step _buildStep(IconData icon, String stepTitle, int index, String subTitle, int stateIndex) {
  return Step(
      stepStyle:  StepStyle(color:(index >= stateIndex) ?  AppColors.primary: AppColors.grey, connectorColor: AppColors.primary),
      isActive: index >= 0,
      state: (index >= stateIndex) ? StepState.complete : StepState.disabled,
      content: const SizedBox(),
      title: Text(stepTitle, style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18)),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(subTitle, style: const TextStyle(color: AppColors.secondary)), Icon(icon, color: AppColors.primary, size: 30)],
      ));
}



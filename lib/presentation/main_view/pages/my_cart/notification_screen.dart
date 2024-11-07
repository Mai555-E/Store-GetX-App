import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text("Notification"), actions: [
        Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(backgroundColor: AppColors.primary, padding: const EdgeInsets.only(left: 13)),
                child: const Text("2 New",
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.white, decoration: TextDecoration.none))))
      ]),
      body: Column(
        children: [
          const CustomTimeAndMarkRow(time: "TODAY"),
          SizedBox(
              height: size.height / 2,
              child: ListView.separated(
                  itemBuilder: (context, index) => CustomNotificationCard(
                        index: index
                      ),
                  itemCount: 3,
                  separatorBuilder: (context, index) => Divider(color: Colors.grey[200]))),
          const SizedBox(height: 10),
          const CustomTimeAndMarkRow(time: "YESTERDAY"),
          Expanded(
              child: ListView.separated(
            itemBuilder: (context, index) => CustomNotificationCard(index: index),
            itemCount: 3,
            separatorBuilder: (context, index) => Divider(color: Colors.grey[200]),
          ))
        ],
      ),
    );
  }
}

class CustomNotificationCard extends StatelessWidget {
  final int index;
  const CustomNotificationCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      color: (index % 2 != 0) ? const Color(0xffededed) : Colors.white,
      width: double.maxFinite,
      height: MediaQuery.sizeOf(context).height / 6.2,
      child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Padding(
                padding: EdgeInsets.only(bottom: 6),
                child: Text("Order Shipped", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18))),
            Text("1h", style: TextStyle(color: AppColors.grey))
          ]),
          leading: IconButton.filledTonal(
              onPressed: () {},
              icon: const Icon(Icons.car_rental, size: 40, color: AppColors.primary),
              style: IconButton.styleFrom(backgroundColor: (index % 2 == 0) ? const Color(0xffededed) : Colors.white)),
          subtitle: const Text(
              "The seller chooses a shipping method based on factors like speed, cost, and destination. Options may include standard shipping, express delivery, or freight services.",
              maxLines: 3,
              style: TextStyle(color: AppColors.grey))),
    );
  }
}

class CustomTimeAndMarkRow extends StatelessWidget {
  final String time;
  const CustomTimeAndMarkRow({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(time, style: const TextStyle(fontSize: 16, color: AppColors.secondary)),
          const Text("Mark all as read", style: TextStyle(fontSize: 15, color: AppColors.primary))
        ],
      ),
    );
  }
}

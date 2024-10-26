import 'package:flutter/material.dart';

import '../../../resources/app_colors.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 15, left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.location_on, color: AppColors.primary),
                  style: IconButton.styleFrom(backgroundColor: const Color(0xffececec), iconSize: 60, minimumSize: const Size(100, 100)),
                ),
                const SizedBox(height: 30),
                const Text("What is Your Location?", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
                const Text("We need to know your location in order to suggest the nearby services",
                    textAlign: TextAlign.center, style: TextStyle(color: Colors.black38)),
                const SizedBox(height: 40),
                SizedBox(height: 55, width: double.infinity, child: ElevatedButton(onPressed: () {}, child: const Text("Allow Location Access"))),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: const ButtonStyle(elevation: WidgetStatePropertyAll(0)),
                  child: Text("Enter Location Manually", style: TextStyle(fontSize: 18, color: Colors.brown[800])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

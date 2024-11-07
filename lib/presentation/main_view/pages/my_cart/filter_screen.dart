import 'package:flutter/material.dart';
import 'package:store_getx_app/presentation/main_view/pages/widgets/shareable_widget_main_view.dart';
import 'package:store_getx_app/presentation/widgets/leading_app_bar.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LeadingAppBar(title: "Filter"),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Text("Brands", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),

          TypesChips()
        ],
      ),
    );
  }
}

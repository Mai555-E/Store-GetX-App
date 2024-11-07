import 'package:flutter/material.dart';

import '../../../resources/app_constants.dart';
import '../../../widgets/leading_app_bar.dart';
import '../widgets/shareable_widget_main_view.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: LeadingAppBar(title: 'Filter'),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(padding: EdgeInsets.symmetric(horizontal: 20), child: Text('Brands')),
            TypesChips(chips: AppConstants.chips),
          ],
        ),
      ),
    );
  }
}

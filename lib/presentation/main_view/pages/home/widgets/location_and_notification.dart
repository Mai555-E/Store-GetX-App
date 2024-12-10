import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';
import '../../../../resources/app_constants.dart';

class LocationAndNotification extends StatelessWidget {
  final String location;
  final ValueChanged<String?> onLocationChanged;
  const LocationAndNotification({super.key, required this.location, required this.onLocationChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Location", style: Theme.of(context).textTheme.bodyMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.location_on, color: AppColors.primary),
            _buildDropDownMenu(location),
            IconButton.filled(
              iconSize: 25,
              onPressed: () {},
              color: AppColors.black,
              icon: const Icon(Icons.notifications_rounded),
              style: IconButton.styleFrom(backgroundColor: AppColors.white),
            )
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildDropDownMenu(String location) {
    return DropdownMenu(
      width: 220,
      menuHeight: 200,
      initialSelection: location,
      onSelected: onLocationChanged,
      textStyle: const TextStyle(fontWeight: FontWeight.w500),
      trailingIcon: const Icon(Icons.keyboard_arrow_down_rounded),
      inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none, enabledBorder: InputBorder.none, contentPadding: EdgeInsets.zero),
      dropdownMenuEntries: List.generate(
          AppConstants.locations.length, (index) => DropdownMenuEntry(value: AppConstants.locations[index], label: AppConstants.locations[index])),
    );
  }
}

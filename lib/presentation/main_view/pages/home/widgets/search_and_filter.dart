import 'package:flutter/material.dart';

import '../../../../resources/app_colors.dart';

class SearchAndFilter extends StatelessWidget {
  const SearchAndFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [_buildSearchBar(), _buildFilterButton()],
    );
  }

  Widget _buildSearchBar() {
    return const SizedBox(
      width: 295,
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search",
          prefixIconColor: AppColors.primary,
          prefixIcon: Icon(Icons.search_rounded),
          hintStyle: TextStyle(fontWeight: FontWeight.w400),
          enabledBorder:
              OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Color.fromRGBO(224, 224, 224, 1))),
        ),
      ),
    );
  }

  Widget _buildFilterButton() {
    return Container(
      width: 45,
      height: 45,
      decoration: const BoxDecoration(color: AppColors.primary, borderRadius: BorderRadius.all(Radius.circular(8))),
      child: const Icon(Icons.filter_alt_rounded, color: Colors.white),
    );
  }
}

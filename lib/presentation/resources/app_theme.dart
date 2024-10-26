import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: "Inter",

      // AppBar
      appBarTheme: const AppBarTheme(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(size: 20),
      ),

      // TextFormField
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: AppColors.grey),
        outlineBorder: BorderSide(color: Colors.amber),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)), borderSide: BorderSide(color: AppColors.grey, width: .5)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)), borderSide: BorderSide(color: AppColors.grey, width: .5)),
      ),

      // ElevatedButton
      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(StadiumBorder()),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(43)),
          minimumSize: WidgetStatePropertyAll(Size.fromHeight(43)),
          surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 20)),
        ),
      ),

      // IconButton
      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          iconSize: 30,
          fixedSize: const Size.square(60),
          side: const BorderSide(color: Colors.transparent, width: .5),
        ),
      ),

      // TextButton
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.only(left: 5),
          textStyle: const TextStyle(height: 1, fontWeight: FontWeight.w500, decoration: TextDecoration.underline),
        ),
      ),

      // Chip
      chipTheme: ChipThemeData(
        showCheckmark: false,
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      ),

      // ModalBottomSheet
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }

  static ThemeMode currentMode = ThemeMode.light;

  static void changeCurrentMode() => Get.changeThemeMode(currentMode = (currentMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark);
}

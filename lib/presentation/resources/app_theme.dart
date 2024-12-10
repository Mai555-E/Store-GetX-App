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
        titleTextStyle: TextStyle(fontSize: 19, fontWeight: FontWeight.w500, color: Colors.black),
      ),

      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 34, color: Colors.black, fontWeight: FontWeight.w700),
        headlineMedium: TextStyle(fontSize: 28, color: Colors.black, fontWeight: FontWeight.w600),
        headlineSmall: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        bodyMedium: TextStyle(fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w400),
        labelLarge: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w500),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w400),
        labelStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w400),
        outlineBorder: BorderSide(color: Colors.amber),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)), borderSide: BorderSide(color: AppColors.grey, width: .5)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(40)), borderSide: BorderSide(color: AppColors.grey, width: .5)),
      ),

      elevatedButtonTheme: const ElevatedButtonThemeData(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(StadiumBorder()),
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(43)),
          foregroundColor: WidgetStatePropertyAll(Colors.white),
          minimumSize: WidgetStatePropertyAll(Size.fromHeight(43)),
          backgroundColor: WidgetStatePropertyAll(AppColors.primary),
          surfaceTintColor: WidgetStatePropertyAll(Colors.transparent),
          textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),

      iconButtonTheme: IconButtonThemeData(
        style: IconButton.styleFrom(
          iconSize: 40,
          fixedSize: const Size.square(60),
          side: const BorderSide(color: Colors.grey, width: .5),
        ),
      ),

      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          alignment: Alignment.centerLeft,
          foregroundColor: AppColors.primary,
          padding: const EdgeInsets.only(left: 5),
        ),
      ),

      chipTheme: ChipThemeData(
        showCheckmark: false,
        backgroundColor: Colors.white,
        selectedColor: AppColors.primary,
        surfaceTintColor: Colors.transparent,
        shape: StadiumBorder(side: BorderSide(color: Colors.grey.shade300)),
      ),

      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.white),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData();
  }

  static ThemeMode currentMode = ThemeMode.light;

  static void changeCurrentMode() => Get.changeThemeMode(currentMode = (currentMode == ThemeMode.dark) ? ThemeMode.light : ThemeMode.dark);
}

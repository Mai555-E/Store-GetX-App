import 'package:flutter/material.dart';

import '../resources/app_constants.dart';
import 'pages/home/home_page.dart';
import 'pages/my_cart/my_cart_page.dart';
import 'pages/profile/profile_page.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int currentIndex = 0;

  bool isSelected(int index) => currentIndex == index;

  // TODO: Add 'My WishList Page' & 'Chats Page'
  static const List<Widget> _pages = [HomePage(), MyCartPage(), Placeholder(), Placeholder(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[currentIndex],
      floatingActionButton: _buildNavigationBottomBar(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildNavigationBottomBar() {
    return Container(
      height: 60,
      width: double.maxFinite,
      padding: const EdgeInsets.all(AppConstants.padding / 5),
      margin: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
      decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          AppConstants.navigationData.length,
          (index) => IconButton.filled(
            style: _buildButtonStyle(index),
            onPressed: () => setState(() => currentIndex = index),
            icon: Icon(isSelected(index) ? AppConstants.navigationData[index].iconFilled : AppConstants.navigationData[index].icon),
          ),
        ),
      ),
    );
  }

  ButtonStyle _buildButtonStyle(int index) {
    return IconButton.styleFrom(
      iconSize: 20,
      side: BorderSide.none,
      fixedSize: const Size.square(45),
      backgroundColor: isSelected(index) ? Colors.white : Colors.transparent,
      foregroundColor: isSelected(index) ? const Color(0xFF704F38) : Colors.grey[700],
    );
  }
}

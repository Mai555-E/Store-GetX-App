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
  static final List<Widget> _pages = [const HomePage(), const MyCartPage(orders: [],), const HomePage(), const HomePage(), const ProfilePage()];

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
      padding: const EdgeInsets.all(4),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: const BoxDecoration(color: Colors.black, borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(
          AppConstants.navigationData.length,
          (index) => IconButton.filled(
            onPressed: () => setState(() => currentIndex = index),
            style: IconButton.styleFrom(
              iconSize: 20,
              side: BorderSide.none,
              fixedSize: const Size.square(45),
              backgroundColor: isSelected(index) ? Colors.white : Colors.transparent,
              foregroundColor: isSelected(index) ? const Color(0xFF704F38) : Colors.grey[700],
            ),
            icon: Icon(isSelected(index) ? AppConstants.navigationData[index].iconFilled : AppConstants.navigationData[index].icon),
          ),
        ),
      ),
    );
  }
}

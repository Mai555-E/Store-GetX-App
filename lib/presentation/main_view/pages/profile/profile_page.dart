import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resources/app_colors.dart';
import '../../../resources/app_constants.dart';
import '../../../resources/routes.dart';

class ProfilePage extends StatelessWidget {
  static int currentIndex = 0;
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile", style: TextStyle(fontWeight: FontWeight.w600))),
      body: Column(
        children: [
          Stack(
            children: [
              CircleAvatar(radius: 60, backgroundColor: Colors.grey[300], child: Image.asset("assets/images/l.png", height: 100)),
              Positioned(
                right: 8,
                bottom: -5,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.primary),
                    child: const Icon(Icons.edit_sharp, color: Colors.white, size: 20),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Align(alignment: Alignment.bottomCenter, child: Text("Mai Emad", style: TextStyle(fontSize: 20))),
          const SizedBox(height: 15),
          SizedBox.fromSize(
            size: Size.fromHeight(MediaQuery.of(context).size.height / 1.8),
            child: Column(children: [for (int i = 0; i < AppConstants.profileTiles.length; ++i) ProfileTitle(i)]),
          ),
        ],
      ),
    );
  }
}

class ProfileTitle extends StatelessWidget {
  final int index;
  const ProfileTitle(this.index, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(AppConstants.profileTiles[index].title),
      onTap: () => Get.toNamed(NamedRoutes.updateProfile),
      leading: Icon(AppConstants.profileTiles[index].icon, color: AppColors.primary),
      trailing: const Icon(Icons.arrow_forward_ios_rounded, color: AppColors.primary),
    );
  }
}

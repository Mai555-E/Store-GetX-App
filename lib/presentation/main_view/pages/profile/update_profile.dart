import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../../auth/auth_widgets.dart';
import '../../../resources/app_colors.dart';
import '../../../resources/routes.dart';
import '../../../widgets.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({super.key});

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  var currentValue = "-1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.toNamed(NamedRoutes.profilePage),
          style: IconButton.styleFrom(shape: const CircleBorder(side: BorderSide(color: Colors.black38))),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const TitleAndSubtitle(
                    title: "Complete Your Profile",
                    subTitle: "Don't worry, only you can see your personal data.No one else will be able to see it "),
                const SizedBox(height: 20),
                Stack(
                  children: [
                    CircleAvatar(radius: 70, backgroundColor: Colors.grey[300], child: Image.asset("assets/images/l.png", height: 100)),
                    Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                          width: 30,
                          height: 30,
                          decoration: const BoxDecoration(color: AppColors.primary, shape: BoxShape.circle),
                          child: const Icon(Icons.edit_sharp, size: 20, color: Colors.white)),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const CustomTextFormField(label: "Name", hint: "Mai Emad"),
                const SizedBox(height: 20),
                const IntlPhoneField(
                  decoration: InputDecoration(
                    hintText: 'Enter the number',
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    label: Text('Phone Number', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black)),
                    border:
                        OutlineInputBorder(borderRadius: BorderRadius.horizontal(left: Radius.circular(30), right: Radius.circular(30))),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                    decoration: const InputDecoration(
                        hintText: "Select",
                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
                        label: Text("Gender", style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black))),
                    value: currentValue,
                    items: const [
                      DropdownMenuItem(value: "-1", child: Text("Select")),
                      DropdownMenuItem(value: "1", child: Text("Male")),
                      DropdownMenuItem(value: "0", child: Text("Female")),
                    ],
                    onChanged: (value) => setState(() => currentValue = value!)),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () {}, child: const Text("Complete Profile"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

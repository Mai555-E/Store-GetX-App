import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../resources/routes.dart';
import '../../../../widgets.dart';

class PasswordManagerScreen extends StatelessWidget {
  const PasswordManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Password Manager", style: TextStyle(fontWeight: FontWeight.w500))),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: MediaQuery.of(context).size.width / 10),
            child: Column(
              children: [
                const CustomTextFormField(hint: '***************', label: " Current Password", icon: Icons.visibility_off),
                const SizedBox(height: 6),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () => Get.toNamed(NamedRoutes.forgotPasswordScreen),
                        child: Text("Forget Password?",
                            style: TextStyle(fontSize: 16, color: Colors.brown[800], decoration: TextDecoration.underline)))),
                const SizedBox(height: 20),
                const CustomTextFormField(label: "New Password", icon: Icons.visibility_off, hint: '***************'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Confirm New Password", icon: Icons.visibility_off, hint: '***************'),
                SizedBox(height: MediaQuery.of(context).size.width / 2),
                SizedBox(
                    height: 55,
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            duration: Duration(seconds: 2),
                            
                            content: Text("Password Changed Successfully"),
                          ));
                         Get.back();
                        },
                        child: const Text("Change Password"))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

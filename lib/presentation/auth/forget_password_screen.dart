import 'package:flutter/material.dart';

import '../widgets.dart';
import '../widgets/leading_app_bar.dart';
import 'auth_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LeadingAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Title & Subtitle
              const Padding(
                padding: EdgeInsets.only(top: 30, bottom: 60),
                child: TitleAndSubtitle(title: "New Password", subTitle: "Your new password must be different\nfrom perviously used password"),
              ),

              // Password & Confirm Password
              const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************'),
              const SizedBox(height: 40),
              const CustomTextFormField(label: "Confirm Password", icon: Icons.visibility_off, hint: '***************'),
              const SizedBox(height: 35),

              // Create New Password
              ElevatedButton(onPressed: () {}, child: const Text("Create New Password"))
            ],
          ),
        ),
      ),
    );
  }
}

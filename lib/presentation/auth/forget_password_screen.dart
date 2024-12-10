import 'package:flutter/material.dart';

import '../resources/app_constants.dart';
import '../widgets.dart';
import '../widgets/leading_app_bar.dart';
import 'auth_widgets.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const LeadingAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
            child: Column(
              children: [
                const TitleAndSubtitle(title: "New Password", subTitle: "Your new password must be different\nfrom perviously used password"),
                const SizedBox(height: 60),
                const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '******************'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Confirm Password", icon: Icons.visibility_off, hint: '******************'),
                const SizedBox(height: 35),
                ElevatedButton(onPressed: () {}, child: const Text("Create New Password"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

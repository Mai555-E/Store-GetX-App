import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../widgets/leading_app_bar.dart';
import 'auth_widgets.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

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
                padding: EdgeInsets.only(top: 30),
                child: TitleAndSubtitle(title: "Verify Code", subTitle: "Please enter the code we just sent to email\n"),
              ),
              Text(email, style: TextStyle(fontSize: 15, color: Colors.brown[800], fontWeight: FontWeight.w700)),
              const SizedBox(height: 30),

              // OTP
              const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [OTP(), OTP(), OTP(), OTP()]),
              const SizedBox(height: 30),

              // Didn't receive OTP
              const Text("Didn't receive OTP?", style: TextStyle(color: AppColors.grey)),
              TextButton(onPressed: () {}, child: const Text("Resend code")),
              const SizedBox(height: 30),

              // Verify
              ElevatedButton(onPressed: () {}, child: const Text("Verify"))
            ],
          ),
        ),
      ),
    );
  }
}

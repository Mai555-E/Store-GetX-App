import 'package:flutter/material.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
import '../widgets/leading_app_bar.dart';
import 'auth_widgets.dart';

class VerifyCodeScreen extends StatelessWidget {
  final String email;
  const VerifyCodeScreen({super.key, required this.email});

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
                const TitleAndSubtitle(title: "Verify Code", subTitle: "Please enter the code we just sent to email"),
                Text(email, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: AppColors.primary)),
                const SizedBox(height: 20),
                const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [OTP(), OTP(), OTP(), OTP()]),
                const SizedBox(height: 30),
                Text("Didn't receive OTP?", style: Theme.of(context).textTheme.bodyMedium),
                TextButton(onPressed: () {}, child: const Text("Resend code")),
                const SizedBox(height: 30),
                ElevatedButton(onPressed: () {}, child: const Text("Verify"))
              ],
          ),
          ),
        ),
      ),
    );
  }
}

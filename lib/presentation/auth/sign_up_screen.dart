import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/routes.dart';
import '../widgets.dart';
import 'auth_widgets.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Title & Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: TitleAndSubtitle(title: "Create Account", subTitle: "Fill your information below\nor register with your social account"),
                ),

                // Username, Email & Password
                const CustomTextFormField(label: "Name", icon: Icons.person_rounded, hint: 'Mai'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************'),

                // Terms & Conditions
                const TermsAndCondition(),
                const SizedBox(height: 20),

                // Sign Up
                ElevatedButton(onPressed: () => Get.offNamed(NamedRoutes.verifyCodeScreen), child: const Text("Sign Up")),
                const SizedBox(height: 30),

                // Or sign up with
                const OrSignWith(label: "up"),
                const SizedBox(height: 30),

                // Social Icons
                const SocialIcons(),
                const SizedBox(height: 20),

                // Do have an account
                const HaveAnAccount(isSignIn: false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({super.key});

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FormField(
          builder: (state) => Checkbox(
            value: _isChecked,
            activeColor: AppColors.primary,
            onChanged: (isChecked) => setState(() => _isChecked = isChecked!),
          ),
        ),
        Text("Agree with", style: Theme.of(context).textTheme.bodyLarge),
        TextButton(onPressed: () {}, child: const Text("Terms & Condition"))
      ],
    );
  }
}

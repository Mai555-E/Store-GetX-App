import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_colors.dart';
import '../resources/app_constants.dart';
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
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
            child: Column(
              children: [
                const TitleAndSubtitle(title: "Create Account", subTitle: "Fill your information below\nor register with your social account"),
                const SizedBox(height: 50),
                const CustomTextFormField(label: "Name", icon: Icons.person_rounded, hint: 'Mai'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************'),
                const TermsAndCondition(),
                const SizedBox(height: 20),
                ElevatedButton(onPressed: () => Get.toNamed(NamedRoutes.verifyCodeScreen), child: const Text("Sign Up")),
                const SizedBox(height: 30),
                const OrSignWith(label: "up"),
                const SizedBox(height: 30),
                const SocialIcons(),
                const SizedBox(height: 20),
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
        TextButton(
          onPressed: () {},
          style: const ButtonStyle(
            textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, fontWeight: FontWeight.w500, decoration: TextDecoration.underline)),
          ),
          child: const Text("Terms & Condition"),
        )
      ],
    );
  }
}

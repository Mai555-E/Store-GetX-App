import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../resources/app_constants.dart';
import '../resources/routes.dart';
import '../widgets.dart';
import 'auth_widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding),
            child: Column(
              children: [
                const TitleAndSubtitle(title: "signIn", subTitle: "Hi! Welcome back, you've been missed"),
                const SizedBox(height: 80),
                const CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '*******************'),
                _buildForgetPassword(),
                const SizedBox(height: 15),
                ElevatedButton(onPressed: () => Get.offNamed(NamedRoutes.mainView), child: const Text("Sign In")),
                const SizedBox(height: 50),
                const OrSignWith(label: "in"),
                const SizedBox(height: 30),
                const SocialIcons(),
                const SizedBox(height: 20),
                const HaveAnAccount(isSignIn: true)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Align _buildForgetPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () => Get.toNamed(NamedRoutes.forgotPasswordScreen),
        style: const ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
        child: const Text("Forgot Password"),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                // Title & Subtitle
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 80),
                  child: TitleAndSubtitle(title: "signIn", subTitle: "Hi! Welcome back, you've been missed"),
                ),

                // Email & Password
                const CustomTextFormField(label: "Email", icon: Icons.email_sharp, hint: 'example@gmail.com'),
                const SizedBox(height: 30),
                const CustomTextFormField(label: "Password", icon: Icons.visibility_off, hint: '***************'),

                // Forgot Password
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: () => Get.toNamed(NamedRoutes.forgotPasswordScreen), child: const Text("Forgot Password?"))),
                const SizedBox(height: 15),

                // Sign In Button
                ElevatedButton(onPressed: () {}, child: const Text("Sign In")),
                const SizedBox(height: 50),

                // Or sign in with
                const OrSignWith(label: "in"),
                const SizedBox(height: 30),

                // Social Icons
                const SocialIcons(),

                const SizedBox(height: 20),

                // Don't have an account
                const HaveAnAccount(isSignIn: true)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

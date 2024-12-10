import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../resources/app_assets.dart';
import '../resources/app_constants.dart';
import '../resources/routes.dart';

class TitleAndSubtitle extends StatelessWidget {
  final String title, subTitle;
  const TitleAndSubtitle({super.key, required this.title, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(StringTranslateExtension(title).tr(), style: Theme.of(context).textTheme.headlineLarge),
        const SizedBox(height: 10),
        Text(subTitle, textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}

class OrSignWith extends StatelessWidget {
  final String label;
  const OrSignWith({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding * 2.5),
      child: Row(children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding / 2),
          child: Text("Or sign $label with", style: Theme.of(context).textTheme.bodyMedium),
        ),
        const Expanded(child: Divider())
      ]),
    );
  }
}

class SocialIcons extends StatelessWidget {
  const SocialIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppConstants.padding * 3.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.apple_rounded, color: Colors.black)),
          IconButton.outlined(onPressed: () {}, icon: Image.asset(AppAssets.googleLogo, width: 35)),
          IconButton.outlined(onPressed: () {}, icon: const Icon(Icons.facebook, color: Colors.blue)),
        ],
      ),
    );
  }
}

class HaveAnAccount extends StatelessWidget {
  final bool isSignIn;
  const HaveAnAccount({super.key, required this.isSignIn});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("${isSignIn ? "Don't" : "Already"} have an account?"),
        TextButton(
          onPressed: () => Get.offNamed(isSignIn ? NamedRoutes.signUpScreen : NamedRoutes.signInScreen),
          style: const ButtonStyle(textStyle: WidgetStatePropertyAll(TextStyle(fontSize: 14, fontWeight: FontWeight.w400))),
          child: Text(isSignIn ? "Sign Up" : "Sign In"),
        ),
      ],
    );
  }
}

class OTP extends StatelessWidget {
  const OTP({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: MediaQuery.sizeOf(context).width / 6,
      child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(hintText: "-"),
        inputFormatters: [LengthLimitingTextInputFormatter(1)],
      ),
    );
  }
}

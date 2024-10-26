import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? icon;
  const CustomTextFormField({super.key, required this.label, this.icon, required this.hint});

  bool _isPassword() => label == "Password";

  IconData? _getSuffixIcon() => _isPassword() ? Icons.visibility_off_rounded : icon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: _isPassword(),
      decoration: InputDecoration(hintText: hint, label: Text(label), suffixIcon: Icon(_getSuffixIcon())),
    );
  }
}

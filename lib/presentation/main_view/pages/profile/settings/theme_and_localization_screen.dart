import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../resources/app_theme.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  IconData change = Icons.light_mode;

  void _changeLanguage() {
    setState(() {
      (context.locale == const Locale("en")) ? context.setLocale(const Locale('ar')) : context.setLocale(const Locale('en'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text("Setting")),
      body: Column(
        children: [
          ListTile(
              title: const Text("Translation"),
              leading: IconButton(onPressed: () => _changeLanguage, icon: const Icon(Icons.translate, size: 30))),
          const SizedBox(height: 50),
          ListTile(
            title: const Text("Theme Mode"),
            leading: IconButton(
                onPressed: () {
                  AppTheme.changeCurrentMode();
                  setState(() {
                    if (AppTheme.currentMode == ThemeMode.dark) {
                      change = Icons.light_mode;
                    } else {
                      change = Icons.dark_mode;
                    }
                  });
                },
                icon: Icon(change, color: Colors.black, size: 25)),
          )
        ],
      ),
    );
  }
}

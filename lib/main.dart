import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app_localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  EasyLocalization.logger.enableLevels = []; // to remove logger
  await EasyLocalization.ensureInitialized();

  await GetStorage.init();

  runApp(const AppLocalization());
}

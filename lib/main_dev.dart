import 'dart:io' show Platform;
import 'package:hermes/app_config.dart';
import 'package:flutter/widgets.dart';
import 'package:hermes/android/app.dart';
import 'package:hermes/ios/app.dart';

Future main() async {
  await AppConfig.init('dev');
  Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());
}

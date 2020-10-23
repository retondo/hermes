import 'dart:io' show Platform;
import 'package:hermes/ios/app.dart';
import 'package:flutter/widgets.dart';
import 'package:hermes/android/app.dart';

void main() {
  return Platform.isIOS ? runApp(IOSApp()) : runApp(AndroidApp());
}

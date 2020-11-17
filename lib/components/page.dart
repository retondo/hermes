import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageScaffold;
import 'dart:io' show Platform;
import 'package:flutter/widgets.dart';

class AppPage extends StatelessWidget {
  final Widget child;

  AppPage({ @required this.child });

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: child,
          height: double.infinity,
        ),
      );
    }

    return CupertinoPageScaffold(child: child);
  }
}

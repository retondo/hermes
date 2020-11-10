import 'package:flutter/material.dart';
import 'package:hermes/components/margin.dart';
import 'package:hermes/themes/colors.dart';

class AppBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      child: SafeArea(
        child: Margin(
          all: 36.0,
          child: Image(
            image: ExactAssetImage('assets/images/logo_white.png'),
            fit: BoxFit.contain,
          ),
        ),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            ColorsTheme.primary,
            ColorsTheme.accent,
          ],
          stops: [0.1, 5],
        ),
      ),
    );
  }
}

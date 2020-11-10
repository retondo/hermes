import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Divider(
          color: Colors.grey,
          thickness: 1.2,
          height: 56.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          color: Colors.white,
          child: Text(
            'OU',
            style: GoogleFonts.openSans(
              fontSize: 12.0,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/widgets.dart';

class FontTheme {
  // static const defaultFontFamily = 'Roboto';
  // static const defaultFontSize = 18.0;
  // static const defaultFontWeight = FontWeight.normal;
  // static const defaultColor = Color.fromARGB(255, 0, 0, 0);
  // static const defaultDecoration = TextDecoration.none;

  TextStyle defaultStyle = DefaultFontStyle.style(
    fontFamily: 'Roboto'
  );
  // TextStyle titleStyle = DefaultFontStyle();

  // static const titleStyle = 
}

class DefaultFontStyle {
  // final style = TextStyle(
  //   fontFamily: 'Roboto',
  //   fontSize: 18.0,
  //   fontWeight: FontWeight.normal,
  //   color: Color.fromARGB(255, 0, 0, 0),
  //   decoration: TextDecoration.none,
  // );
  // static const defaultFontFamily = 'Roboto';
  // static const defaultFontSize = 18.0;
  // static const defaultFontWeight = FontWeight.normal;
  // static const defaultColor = Color.fromARGB(255, 0, 0, 0);
  // static const defaultDecoration = TextDecoration.none;

  static get style => TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18.0,
    fontWeight: FontWeight.normal,
    color: Color.fromARGB(255, 0, 0, 0),
    decoration: TextDecoration.none,
  );
}
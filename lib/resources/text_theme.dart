import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSizes {
  static const caption = 11.0;
  static const bodySmall = 12.0;
  static const bodyMedium = 14.0;
  static const bodyLarge = 16.0;
  static const heading3 = 20.0;
  static const heading2 = 24.0;
  static const heading1 = 32.0;
}

extension TextThemeExt on TextTheme {
  TextStyle get caption => bodyText1.copyWith(fontSize: TextSizes.caption);

  TextStyle get bodySmall => bodyText1.copyWith(fontSize: TextSizes.bodySmall);

  TextStyle get bodyMedium =>
      bodyText1.copyWith(fontSize: TextSizes.bodyMedium);

  TextStyle get bodyLarge => bodyText1.copyWith(fontSize: TextSizes.bodyLarge);

  TextStyle get heading3 => bodyText1.copyWith(fontSize: TextSizes.heading3);

  TextStyle get heading2 => bodyText1.copyWith(fontSize: TextSizes.heading2);

  TextStyle get heading1 => bodyText1.copyWith(fontSize: TextSizes.heading1);
}

extension TextStyleExt on TextStyle {
  // Font Weight
  TextStyle get bold => copyWith(fontWeight: FontWeight.bold);

  // Font Color
  TextStyle get colorBlack => copyWith(color: Colors.black);

  TextStyle get colorWhite => copyWith(color: Colors.white);

  TextStyle get colorGrey => copyWith(color: Colors.grey);
}

TextTheme createTextTheme() => TextTheme(
      bodyText1: TextStyle(fontWeight: FontWeight.normal),
    );

TextTheme textTheme(BuildContext context) {
  return GoogleFonts.latoTextTheme(Theme.of(context).textTheme);
}

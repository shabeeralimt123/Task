import 'package:flutter/material.dart';

import 'package:test_firebase/core/utils/palette.dart';

// Define your custom styles
TextStyle heading1 = const TextStyle(
  color: Palette.black,
  fontSize: 48,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  //letterSpacing: -0.44,
);
TextStyle heading2 = const TextStyle(
  color: Palette.black,
  fontSize: 40,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
  //letterSpacing: -0.44,
);
TextStyle heading3 = const TextStyle(
  color: Palette.black,
  fontSize: 32,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);
TextStyle bodyXLarge = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);
TextStyle bodyXLargeM = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle bodyMediumR = const TextStyle(
  color: Palette.black,
  fontSize: 14,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
TextStyle bodyXLarge2 = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle heading4 = const TextStyle(
  color: Palette.black,
  fontSize: 24,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
TextStyle heading5 = const TextStyle(
  color: Palette.black,
  fontSize: 20,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
TextStyle heading6 = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w700,
);
TextStyle bodyLarge4 = const TextStyle(
  color: Palette.black,
  fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
TextStyle bodyXlargeS = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
TextStyle bodyXlargeR = const TextStyle(
  color: Palette.black,
  fontSize: 18,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);
TextStyle bodyMedium4 = const TextStyle(
  color: Palette.black,
  fontSize: 14,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w400,
);

TextStyle bodyLarge2 = const TextStyle(
  color: Palette.black,
  fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);
TextStyle bodyLargeS = const TextStyle(
  color: Palette.black,
  fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w600,
);

TextStyle bodyLarge3 = const TextStyle(
  color: Palette.blue,
  fontSize: 16,
  fontFamily: 'Poppins',
  fontWeight: FontWeight.w500,
);
// Define your base theme data
ThemeData buildTheme({
  required bool isDarkMode,
  required String fontFamily,
}) {
  final baseTheme = isDarkMode ? ThemeData.dark() : ThemeData.light();

  return baseTheme.copyWith(
    primaryColor: Colors.deepPurple,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: TextTheme(
      displayLarge: heading1,
      displayMedium: heading2,
      titleLarge: heading3,
      bodyLarge: heading4,
      bodySmall: heading5,
      bodyMedium: heading6,
    ).apply(fontFamily: fontFamily),
    buttonTheme: const ButtonThemeData(
      buttonColor: Colors.deepPurple,
      textTheme: ButtonTextTheme.primary,
    ),
  );
}

// Create your themes
final lightTheme = buildTheme(isDarkMode: false, fontFamily: 'Poppins');
final darkTheme = buildTheme(isDarkMode: true, fontFamily: 'Poppins');

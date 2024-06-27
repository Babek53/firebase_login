import 'package:flutter/material.dart';

class CustomColorScheme {
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: ColorName.neonBlue,
    onPrimary: Colors.white,
    primaryContainer: Color(0xFFCCE7FF),
    onPrimaryContainer: Color(0xFF00274D),
    secondary: ColorName.futuristicTeal,
    onSecondary: Colors.white,
    secondaryContainer: Color(0xFFC2F2E9),
    onSecondaryContainer: Color(0xFF004D40),
    tertiary: ColorName.neonYellow,
    onTertiary: Colors.black,
    tertiaryContainer: Color(0xFFFFFFE0),
    onTertiaryContainer: Color(0xFF3E2723),
    error: ColorName.crimsonRed,
    onError: Colors.white,
    errorContainer: Color(0xFFF9DEDC),
    onErrorContainer: Color(0xFF410E0B),
    outline: Color(0xFF79747E),
    surface: Colors.white,
    onSurface: Color(0xFF1C1B1F),
    surfaceContainerHighest: Color(0xFFE7E0EC),
    inverseSurface: Color(0xFF313033),
    onInverseSurface: Color(0xFFF4EFF4),
    inversePrimary: Color(0xFF67A1D7),
    shadow: Colors.black,
    surfaceTint: ColorName.neonBlue,
    outlineVariant: Color(0xFFCAC4D0),
    scrim: Colors.black,
  );

  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: ColorName.neonBlue,
    onPrimary: Color(0xFFCCE7FF),
    primaryContainer: Color(0xFF00274D),
    onPrimaryContainer: Color(0xFFE1F5FE),
    secondary: ColorName.futuristicTeal,
    onSecondary: Color(0xFFC2F2E9),
    secondaryContainer: Color(0xFF004D40),
    onSecondaryContainer: Color(0xFFFFEBEE),
    tertiary: ColorName.neonYellow,
    onTertiary: Color(0xFF3E2723),
    tertiaryContainer: Color(0xFFFFFFE0),
    onTertiaryContainer: Color(0xFF6D4C41),
    error: Color(0xFFF2B8B5),
    onError: Color(0xFF601410),
    errorContainer: Color(0xFF8C1D18),
    onErrorContainer: Color(0xFFF9DEDC),
    outline: Color(0xFF938F99),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE6E1E5),
    surfaceContainerHighest: Color(0xFF49454F),
    inverseSurface: Color(0xFFE6E1E5),
    onInverseSurface: Color(0xFF313033),
    inversePrimary: Color(0xFF67A1D7),
    shadow: Colors.black,
    surfaceTint: ColorName.neonBlue,
    outlineVariant: Color(0xFF49454F),
    scrim: Colors.black,
  );
}

class ColorName {
  static const Color crimsonRed = Color(0xFFDC143C);
  static const Color neonBlue = Color(0xFF1E90FF);
  static const Color futuristicTeal = Color(0xFF008080);
  static const Color neonYellow = Color(0xFFFFFF00);
}

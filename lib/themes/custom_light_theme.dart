import 'package:flutter/material.dart';
import 'package:myapp/themes/custom_color_scheme.dart';
import 'package:myapp/themes/custom_theme.dart';

final class CustomLightTheme implements CustomTheme {
  @override
  ThemeData get themeData => ThemeData(
        useMaterial3: true,
        colorScheme: CustomColorScheme.lightColorScheme,
      );
}

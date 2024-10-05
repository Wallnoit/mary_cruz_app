import 'package:flutter/material.dart';
import 'package:mary_cruz_app/core/theme/color_scheme/color_scheme_dark.dart';
import 'package:mary_cruz_app/core/theme/color_scheme/color_scheme_light.dart';
import 'package:mary_cruz_app/core/theme/text_scheme/global_text_theme.dart';

class GlobalThemeData {
  static final Color _lightFocusColor = Colors.black.withOpacity(0.12);
  static final Color _darkFocusColor = Colors.white.withOpacity(0.12);

  static ThemeData lightThemeData =
      themeData(lightColorScheme, _lightFocusColor, lightGlobalText);

  static ThemeData darkThemeData =
      themeData(darkColorScheme, _darkFocusColor, darkGlobalText);

  static ThemeData themeData(
      ColorScheme colorScheme, Color focusColor, TextTheme globalText) {
    return ThemeData(
        colorScheme: colorScheme,
        canvasColor: colorScheme.surface,
        scaffoldBackgroundColor: colorScheme.surface,
        highlightColor: Colors.transparent,
        textTheme: globalText,
        focusColor: focusColor);
  }
}

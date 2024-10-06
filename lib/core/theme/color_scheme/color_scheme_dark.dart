import 'package:flutter/material.dart';

const onBackground = Colors.white;

const primary = Color(0xFFE61F84);
const secondary = Color(0xFF40B2E8);
const tertiary = Color(0xFFC5C5C6);
const surface = Color(0xFF18181B);

ColorScheme darkColorScheme = ColorScheme.fromSeed(
  seedColor: primary,
  primary: primary,
  secondary: secondary,
  tertiary: tertiary,
  surface: surface,
  onSurface: onBackground,
  brightness: Brightness.dark,
);

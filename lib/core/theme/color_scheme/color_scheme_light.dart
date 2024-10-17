import 'package:flutter/material.dart';

// const primary = Color(0xFFE61F84);
const primary = Color(0xFF18181B);

const secondary = Color(0xFF40B2E8);
const tertiary = Color(0xFF7F7F7F);
const background = Colors.white;
const onSurface = Color(0xFF18181B);

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: primary,
  primary: primary,
  secondary: secondary,
  tertiary: tertiary,
  surface: background,
  onSurface: onSurface,
  brightness: Brightness.light,
);

import 'package:flutter/material.dart';

const primary = Color(0xFF18181B);
const secondary = Color(0xFF747476);
const tertiary = Color(0xFFC5C5C6);
const background = Colors.white;

ColorScheme lightColorScheme = ColorScheme.fromSeed(
  seedColor: primary,
  primary: primary,
  secondary: secondary,
  tertiary: tertiary,
  surface: background,
  onSurface: primary,
  brightness: Brightness.light,
);

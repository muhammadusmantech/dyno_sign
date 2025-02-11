import 'package:flutter/material.dart';

const ColorScheme colorSchemeLight = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xffF96A70),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0x0ff3dbda),
  onPrimaryContainer: Color(0xff130f11),
  secondary: Color(0xff1C1243),
  onSecondary: Color(0xff000000),
  secondaryContainer: Color(0xffe8b5ce),
  onSecondaryContainer: Color(0xff141211),
  tertiary: Color(0xfff39682),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xffffcfc3),
  onTertiaryContainer: Color(0xff141110),
  error: Color(0xff790000),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfff1d8d8),
  onErrorContainer: Color(0xff141212),
  surface: Color(0xfffdfafb),
  onSurface: Color(0xff090909),
  onSurfaceVariant: Color(0xff121112),
  outline: Color(0xff7c7c7c),
  outlineVariant: Color(0xffc8c8c8),
  shadow: Color(0xFFE8E8E8),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff161313),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xfffff4f9),
  surfaceTint: Color(0xffce5b78),
);

const ColorScheme colorSchemeDark = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xffeec4d8),
  onPrimary: Color(0xff141314),
  primaryContainer: Color(0xffce5b78),
  onPrimaryContainer: Color(0xffffeef2),
  secondary: Color(0xfff5d6c6),
  onSecondary: Color(0xff141413),
  secondaryContainer: Color(0xffeba689),
  onSecondaryContainer: Color(0xff281d18),
  tertiary: Color(0xfff7e0d4),
  onTertiary: Color(0xff141414),
  tertiaryContainer: Color(0xffeebda8),
  onTertiaryContainer: Color(0xff28201d),
  error: Color(0xffcf6679),
  onError: Color(0xff140c0d),
  errorContainer: Color(0xffb1384e),
  onErrorContainer: Color(0xfffbe8ec),
  surface: Color(0xff1c1a1b),
  onSurface: Color(0xffededed),
  onSurfaceVariant: Color(0xffe1e1e1),
  outline: Color(0xff7a7a7a),
  outlineVariant: Color(0xff2e2e2e),
  shadow: Color(0xFF1F1F1F),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xfffefbfd),
  onInverseSurface: Color(0xff131313),
  inversePrimary: Color(0xff75636b),
  surfaceTint: Color(0xffeec4d8),
);

/// [Light]
const MaterialColor primaryMaterial = MaterialColor(0xffF96A70, <int, Color>{
  50: Color.fromRGBO(249, 106, 112, .1),
  100: Color.fromRGBO(249, 106, 112, .2),
  200: Color.fromRGBO(249, 106, 112, .3),
  300: Color.fromRGBO(249, 106, 112, .4),
  400: Color.fromRGBO(249, 106, 112, .5),
  500: Color.fromRGBO(249, 106, 112, .6),
  600: Color.fromRGBO(249, 106, 112, .7),
  700: Color.fromRGBO(249, 106, 112, .8),
  800: Color.fromRGBO(249, 106, 112, .9),
  900: Color.fromRGBO(249, 106, 112, 1),
});

/// [Dark]
const MaterialColor darkPrimaryMaterial = MaterialColor(0xffeec4d8, <int, Color>{
  50: Color.fromRGBO(238, 196, 216, .1),
  100: Color.fromRGBO(238, 196, 216, .2),
  200: Color.fromRGBO(238, 196, 216, .3),
  300: Color.fromRGBO(238, 196, 216, .4),
  400: Color.fromRGBO(238, 196, 216, .5),
  500: Color.fromRGBO(238, 196, 216, .6),
  600: Color.fromRGBO(238, 196, 216, .7),
  700: Color.fromRGBO(238, 196, 216, .8),
  800: Color.fromRGBO(238, 196, 216, .9),
  900: Color.fromRGBO(238, 196, 216, 1),
});

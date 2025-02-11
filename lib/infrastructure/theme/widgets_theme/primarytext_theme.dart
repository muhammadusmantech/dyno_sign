import 'package:flutter/material.dart';

import '../theme.dart';

TextTheme get textTheme => TextTheme(
      displayLarge:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 96.0, fontWeight: FontWeight.w300),
      displayMedium:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 60.0, fontWeight: FontWeight.w300),
      displaySmall:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 48.0, fontWeight: FontWeight.w400),
      headlineMedium:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 34.0, fontWeight: FontWeight.w400),
      headlineSmall:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 24.0, fontWeight: FontWeight.w400),
      titleLarge:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 20.0, fontWeight: FontWeight.w500),
      titleMedium:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 16.0, fontWeight: FontWeight.w400),
      titleSmall:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      bodyLarge:
          TextStyle(color: colorSchemeLight.onSurface, fontSize: 16.0, fontWeight: FontWeight.w400),
      bodyMedium:
          TextStyle(color: colorSchemeLight.onSurface, fontSize: 14.0, fontWeight: FontWeight.w400),
      labelLarge:
          TextStyle(color: colorSchemeLight.onPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      bodySmall:
          TextStyle(color: colorSchemeLight.onSurface, fontSize: 12.0, fontWeight: FontWeight.w400),
      labelSmall:
          TextStyle(color: colorSchemeLight.onSurface, fontSize: 10.0, fontWeight: FontWeight.w400),
    );

TextTheme get darkTextTheme => TextTheme(
      displayLarge:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 96.0, fontWeight: FontWeight.w300),
      displayMedium:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 60.0, fontWeight: FontWeight.w300),
      displaySmall:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 48.0, fontWeight: FontWeight.w400),
      headlineMedium:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 34.0, fontWeight: FontWeight.w400),
      headlineSmall:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 24.0, fontWeight: FontWeight.w400),
      titleLarge:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 20.0, fontWeight: FontWeight.w500),
      titleMedium:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 16.0, fontWeight: FontWeight.w400),
      titleSmall:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      bodyLarge:
          TextStyle(color: colorSchemeDark.onSurface, fontSize: 16.0, fontWeight: FontWeight.w400),
      bodyMedium:
          TextStyle(color: colorSchemeDark.onSurface, fontSize: 14.0, fontWeight: FontWeight.w400),
      labelLarge:
          TextStyle(color: colorSchemeDark.onPrimary, fontSize: 14.0, fontWeight: FontWeight.w500),
      bodySmall:
          TextStyle(color: colorSchemeDark.onSurface, fontSize: 12.0, fontWeight: FontWeight.w400),
      labelSmall:
          TextStyle(color: colorSchemeDark.onSurface, fontSize: 10.0, fontWeight: FontWeight.w400),
    );

import 'package:flutter/material.dart';
import 'package:get/get.dart';

extension ContextExtensions on BuildContext {
  double get displayLargeFontSize => textTheme.displayLarge?.fontSize ?? 57;
  double get displayMediumFontSize => textTheme.displayMedium?.fontSize ?? 45;
  double get displaySmallFontSize => textTheme.displaySmall?.fontSize ?? 36;

  double get headlineLargeFontSize => textTheme.headlineLarge?.fontSize ?? 32;
  double get headlineMediumFontSize => textTheme.headlineMedium?.fontSize ?? 28;
  double get headlineSmallFontSize => textTheme.headlineSmall?.fontSize ?? 24;

  double get titleLargeFontSize => textTheme.titleLarge?.fontSize ?? 22;
  double get titleMediumFontSize => textTheme.titleMedium?.fontSize ?? 16;
  double get titleSmallFontSize => textTheme.titleSmall?.fontSize ?? 14;

  double get bodyLargeFontSize => textTheme.bodyLarge?.fontSize ?? 16;
  double get bodyMediumFontSize => textTheme.bodyMedium?.fontSize ?? 14;
  double get bodySmallFontSize => textTheme.bodySmall?.fontSize ?? 12;

  double get labelLargeFontSize => textTheme.labelLarge?.fontSize ?? 14;
  double get labelMediumFontSize => textTheme.labelMedium?.fontSize ?? 12;
  double get labelSmallFontSize => textTheme.labelSmall?.fontSize ?? 11;
}

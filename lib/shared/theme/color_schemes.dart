import 'package:flutter/material.dart';

/// Centralized color schemes for light and dark themes.
class AppColorSchemes {
  AppColorSchemes._();

  static const Color lightSurfaceVariant = Color(0xFFF8F8FA);
  static const Color darkSurfaceVariant = Color(0xFF1E1E1E);

  static const Color termsAndConditionsTextColor = Color(0xFF4B5563);
  static const Color termsAndConditionsTextColorDark = Color(0xFF9CA3AF);
  static const Color subtitleTextColor = Color(0xFF374151);
  static const Color subtitleTextColorDark = Color(0xFFD1D5DB);

  /// Default light color scheme.
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFFFF5F1F),
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFFFDBCE),
    onPrimaryContainer: Color(0xFF351000),
    secondary: Color(0xFF535F70),
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFD7E3F7),
    onSecondaryContainer: Color(0xFF101C2B),
    tertiary: Color(0xFF6B5778),
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: Color(0xFFF2DAFF),
    onTertiaryContainer: Color(0xFF251431),
    error: Color(0xFFBA1A1A),
    onError: Color(0xFFFFFFFF),
    errorContainer: Color(0xFFFFDAD6),
    onErrorContainer: Color(0xFF410002),
    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF111827),
    surfaceContainerHighest: Color(0xFFDFE2EB),
    onSurfaceVariant: Color(0xFF717680),
    outline: Color(0x1A000000),
    shadow: Color(0xFF000000),
  );

  /// Default dark color scheme.
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFFFFB598),
    onPrimary: Color(0xFF5B1B00),
    primaryContainer: Color(0xFF812B00),
    onPrimaryContainer: Color(0xFFFFDBCE),
    secondary: Color(0xFFBBC7DB),
    onSecondary: Color(0xFF253140),
    secondaryContainer: Color(0xFF3B4858),
    onSecondaryContainer: Color(0xFFD7E3F7),
    tertiary: Color(0xFFD6BEE4),
    onTertiary: Color(0xFF3B2948),
    tertiaryContainer: Color(0xFF523F5F),
    onTertiaryContainer: Color(0xFFF2DAFF),
    error: Color(0xFFFFB4AB),
    onError: Color(0xFF690005),
    errorContainer: Color(0xFF93000A),
    onErrorContainer: Color(0xFFFFDAD6),
    surface: Color(0xFF111318),
    onSurface: Color(0xFFE2E2E9),
    surfaceContainerHighest: Color(0xFF43474E),
    onSurfaceVariant: Color(0xFFC3C7CF),
    outline: Color(0xFF8D9199),
    shadow: Color(0xFF000000),
  );
}

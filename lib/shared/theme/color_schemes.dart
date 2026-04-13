import 'package:flutter/material.dart';

/// Centralized color schemes for light and dark themes.
class AppColorSchemes {
  AppColorSchemes._();

  static const Color lightSurfaceVariant = Color(0xFFF8F8FA);
  static const Color darkSurfaceVariant = Color(0xFF1E1E1E);
  static const Color termsAndConditionTitleBackgroundColor = Color(0xFFF9FAFB);
  static const Color importantNoticeBackgroundColor = Color(0xFFFFF9F6);

  static const Color termsAndConditionsTextColor = Color(0xFF4B5563);
  static const Color termsAndConditionsTextColorDark = Color(0xFF9CA3AF);
  static const Color subtitleTextColor = Color(0xFF374151);
  static const Color subtitleTextColorDark = Color(0xFFD1D5DB);

  // Primary
  static const Color primary50 = Color(0xFFFEF0E8);
  static const Color primary100 = Color(0xFFFCD4B8);
  static const Color primary200 = Color(0xFFFAB080);
  static const Color primary300 = Color(0xFFF98551);
  static const Color primary400 = Color(0xFFFF783B);
  static const Color primary500 = Color(0xFFF85F21);
  static const Color primary600 = Color(0xFFD94E11);
  static const Color primary700 = Color(0xFFA83B08);
  static const Color primary800 = Color(0xFF6E2704);
  static const Color primary900 = Color(0xFF3D1E00);
  static const Color primary950 = Color(0xFF1F0F00);

  // Secondary
  static const Color secondary50 = Color(0xFFFAFBFF);
  static const Color secondary100 = Color(0xFFEEF0F8);
  static const Color secondary200 = Color(0xFFBFC5DE);
  static const Color secondary400 = Color(0xFF6275A8);
  static const Color secondary600 = Color(0xFF2E4077);
  static const Color secondary900 = Color(0xFF12173A);

  // Accent
  static const Color accent50 = Color(0xFFFFF7E0);
  static const Color accent200 = Color(0xFFFDDFA0);
  static const Color accent500 = Color(0xFFF5A622);
  static const Color accent700 = Color(0xFFC47C02);
  static const Color accent900 = Color(0xFF7A4C00);
  static const Color accent950 = Color(0xFF7E22CE);

  // Neutrals
  static const Color neutrals0 = Color(0xFFFFFFFF);
  static const Color neutrals50 = Color(0xFFFAFAF8);
  static const Color neutrals100 = Color(0xFFF2F0EC);
  static const Color neutrals200 = Color(0xFFE0DED8);
  static const Color neutrals300 = Color(0xFFC4C1B8);
  static const Color neutrals400 = Color(0xFF9C9990);
  static const Color neutrals500 = Color(0xFF6B6860);
  static const Color neutrals700 = Color(0xFF3A3835);
  static const Color neutrals900 = Color(0xFF1A1918);

  // Success
  static const Color success = Color(0xFF39C07A);
  static const Color successDark = Color(0xFF009A1A);
  static const Color warning = Color(0xFFF5A622);
  static const Color error = Color(0xFFE8384A);

  // Others
  static const Color goldStar = Color(0xFF3B7DD8);
  static const Color darkSurface = Color(0xFFF5A622);
  static const Color errorBlack = Color(0xFF12173A);

  /// Default light color scheme.
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primary500,
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: primary100,
    onPrimaryContainer: primary900,
    secondary: secondary600,
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: secondary100,
    onSecondaryContainer: secondary900,
    tertiary: accent500,
    onTertiary: Color(0xFFFFFFFF),
    tertiaryContainer: accent200,
    onTertiaryContainer: accent900,
    error: error,
    onError: Color(0xFFFFFFFF),
    errorContainer: errorBlack,
    onErrorContainer: error,
    surface: neutrals50,
    onSurface: neutrals900,
    surfaceContainerHighest: neutrals200,
    onSurfaceVariant: neutrals500,
    outline: neutrals300,
    shadow: Color(0xFF000000),
  );

  /// Default dark color scheme.
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: darkSurface,
    onPrimary: primary950,
    primaryContainer: primary700,
    onPrimaryContainer: primary50,
    secondary: secondary200,
    onSecondary: secondary900,
    secondaryContainer: secondary600,
    onSecondaryContainer: secondary100,
    tertiary: accent200,
    onTertiary: accent900,
    tertiaryContainer: accent500,
    onTertiaryContainer: accent50,
    error: error,
    onError: Color(0xFFFFFFFF),
    errorContainer: errorBlack,
    onErrorContainer: error,
    surface: neutrals900,
    onSurface: neutrals50,
    surfaceContainerHighest: neutrals700,
    onSurfaceVariant: neutrals300,
    outline: neutrals500,
    shadow: Color(0xFF000000),
  );
}

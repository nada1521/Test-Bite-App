import 'package:flutter/material.dart';

class NewAppColors {
  // Brand Base
  static const Color primary = Color(0xFF0A400C);
  static const Color primaryLight = Color(0xFF146017);
  static const Color secondary = Color(0xFFE7A33E);
  static const Color accent = Color(0xFFD94F04);

  // Feedback Colors
  static const Color error = Color(0xFFC62828);
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFFFF9800);
  static const Color info = Color(0xFF0288D1);

  // Neutral / Typography
  static const Color textDark = Color(0xFF333333);
  static const Color textMedium = Color(0xFF666666);
  static const Color textLight = Color(0xFF9A9A9A);
  static const Color disabled = Color(0xFFBFBFBF);

  // Basic colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
}

class LightThemeColors {
  // Base
  static const Color background = Color(0xFFFFFDF9);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color appBar = NewAppColors.primary;

  static const Color divider = Color(0xFFDADADA);

  // Text
  static const Color heading = NewAppColors.primary;
  static const Color subheading = NewAppColors.primaryLight;
  static const Color body = NewAppColors.textDark;
  static const Color secondaryText = NewAppColors.textMedium;
  static const Color hint = NewAppColors.textLight;

  // Inputs
  static const Color inputBorder = Color(0xFFC9C9C9);
  static const Color inputFocusedBorder = NewAppColors.primary;
  static const Color inputBackground = Colors.white;

  // Buttons
  static const Color primaryButton = NewAppColors.primary;
  static const Color secondaryButton = NewAppColors.secondary;
  static const Color accentButton = NewAppColors.accent;
  static const Color disabledButton = Color(0xFFD3D3D3);

  // Icons
  static const Color iconActive = NewAppColors.primary;
  static const Color iconInactive = NewAppColors.textLight;
}

class DarkThemeColors {
  // Base
  static const Color background = Color(0xFF121212);
  static const Color surface = Color(0xFF1E1E1E);
  static const Color appBar = Color(0xFF0E3010);
  static const Color navigationBar = Color(0xFF1C1C1C);
  static const Color divider = Color(0xFF2C2C2C);

  // Brand Tones
  static const Color primary = Color(0xFF58A65C);
  static const Color primaryVariant = Color(0xFF4E9253);
  static const Color secondary = Color(0xFFFFB84C);
  static const Color accent = Color(0xFFFF6F2C);

  // Text
  static const Color heading = primary;
  static const Color subheading = Color(0xFF8FCF91);
  static const Color body = Color(0xFFF3F3F3);
  static const Color secondaryText = Color(0xFFBDBDBD);
  static const Color hint = Color(0xFF9E9E9E);
  static const Color disabled = Color(0xFF6D6D6D);

  // Inputs
  static const Color inputBorder = Color(0xFF3A3A3A);
  static const Color inputFocusedBorder = primary;
  static const Color inputBackground = Color(0xFF1E1E1E);

  // Buttons
  static const Color primaryButton = primary;
  static const Color secondaryButton = secondary;
  static const Color accentButton = accent;
  static const Color disabledButton = Color(0xFF2C2C2C);

  // Icons
  static const Color iconActive = primary;
  static const Color iconInactive = Color(0xFF9E9E9E);
}

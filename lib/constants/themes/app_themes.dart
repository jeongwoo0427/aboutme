import 'package:aboutme/constants/themes/typography.dart';
import 'package:flutter/material.dart';

import '../app_font_family.dart';
import 'app_color_schemes.dart';

class AppThemes {
  //the light theme
  static final ThemeData lightTheme = ThemeData(
    //useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: AppFontFamily.notoSansKR,
    scaffoldBackgroundColor: AppColorSchemes.lightColorScheme.background,
    appBarTheme: const AppBarTheme().copyWith(
        surfaceTintColor: AppColorSchemes.lightColorScheme.background,
        backgroundColor: AppColorSchemes.lightColorScheme.background,
        foregroundColor: AppColorSchemes.lightColorScheme.onBackground),
    // iconTheme: IconThemeData(color: _lightFontColor),
    // tabBarTheme: TabBarTheme().copyWith(labelColor: _lightOnBackgroundColor),
    // hoverColor: _lightPrimaryColor.withOpacity(0.4),
    // splashColor: _lightSecondaryColor.withOpacity(0.4),
    textTheme: appTextTheme,
    colorScheme: AppColorSchemes.lightColorScheme,
  );

  //the dark theme
  static final ThemeData darkTheme = ThemeData(
      //useMaterial3: true,
      brightness: Brightness.dark,
      fontFamily: AppFontFamily.notoSansKR,
      scaffoldBackgroundColor: AppColorSchemes.darkColorScheme.background,
      appBarTheme: const AppBarTheme().copyWith(
          surfaceTintColor: AppColorSchemes.darkColorScheme.background,
          backgroundColor: AppColorSchemes.darkColorScheme.background,
          foregroundColor: AppColorSchemes.darkColorScheme.onBackground),
      // iconTheme: IconThemeData(color: _darkFontColor),
      // tabBarTheme: TabBarTheme().copyWith(labelColor: _darkOnBackgroundColor),
      // hoverColor: _darkPrimaryColor.withOpacity(0.4),
      // splashColor: _darkSecondaryColor.withOpacity(0.4),
      textTheme: appTextTheme,
      colorScheme: AppColorSchemes.darkColorScheme);
}

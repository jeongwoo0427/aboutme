import 'package:flutter/material.dart';

import '../app_font_family.dart';


const _defaultFont = TextStyle(fontFamily: AppFontFamily.notoSansKR);
///TODO : 모바일 단말기에서 테스트 진행해보기

//final _defaultFont = GoogleFonts.notoSans();
final appTextTheme = TextTheme(

  displayLarge: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 57,
    height: 64 / 57,
    letterSpacing: -0.25,
  ),
  displayMedium: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 45,
    height: 52 / 45,
  ),
  displaySmall: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 36,
    height: 44 / 36,
  ),
  headlineLarge: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 32,
    height: 40 / 32,
  ),
  headlineMedium: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 28,
    height: 36 / 28,
  ),
  headlineSmall: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 24,
    height: 32 / 24,
  ),
  titleLarge: _defaultFont.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 22,
    height: 28 / 22,
  ),
  titleMedium: _defaultFont.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 16,
    height: 24 / 16,
    letterSpacing: 0.1,
  ),
  titleSmall: _defaultFont.copyWith(
    fontWeight: FontWeight.w600,
    fontSize: 14,
    height: 20 / 14,
    letterSpacing: 0.1,
  ),
  labelLarge: _defaultFont.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 14,
    height: 20 / 14,
  ),
  labelMedium: _defaultFont.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 12,
    height: 16 / 12,
  ),
  labelSmall: _defaultFont.copyWith(
    fontWeight: FontWeight.w700,
    fontSize: 11,
    height: 16 / 11,
  ),
  bodyLarge: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 16,
    height: 24 / 16,
  ),
  bodyMedium: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    height: 20 / 14,
  ),
  bodySmall: _defaultFont.copyWith(
    fontWeight: FontWeight.w400,
    fontSize: 12,
    height: 16 / 12,
  ),
);

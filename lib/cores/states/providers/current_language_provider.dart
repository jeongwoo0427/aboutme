import 'package:aboutme/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLanguageProvider =
    StateNotifierProvider<CurrentLanguageNotifier, Language>((ref) {
  return CurrentLanguageNotifier();
});

class CurrentLanguageNotifier extends StateNotifier<Language> {
  CurrentLanguageNotifier() : super(Language.kr);

  Language get currentLanguage => state;

  void changeLanguage(Language targetLanguage) {
    state = targetLanguage;
  }
}

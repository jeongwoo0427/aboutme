import 'package:aboutme/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLanguageProvider =
    StateNotifierProvider<CurrentLanguageNotifier, LanguageCode>((ref) {
  return CurrentLanguageNotifier();
});

class CurrentLanguageNotifier extends StateNotifier<LanguageCode> {
  CurrentLanguageNotifier() : super(LanguageCode.ko);

  LanguageCode get currentLanguage => state;

  void changeLanguage(LanguageCode targetLanguage) {
    state = targetLanguage;
  }
}

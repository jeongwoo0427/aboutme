
import 'package:aboutme/constants/app_localizations.dart';
import 'package:aboutme/cores/states/providers/current_language_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

extension WidgetRefExtension on WidgetRef{
  Localizations get localizations => AppLocalizations.get(watch(currentLanguageProvider));
}
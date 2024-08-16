import 'package:aboutme/constants/app_constants.dart';


class AppLocalizations{

  static final KoreanLocalizations koreanLocalizations = KoreanLocalizations();
  static final EnglishLocalizations englishLocalizations = EnglishLocalizations();

  static Localizations get(LanguageCode code){
    if(code == LanguageCode.ko) {
      return koreanLocalizations;
    }else if(code== LanguageCode.en){
      return englishLocalizations;
    }else{
      return englishLocalizations;
    }
  }
}



abstract class Localizations{
  String get introduction_screen_greeting_page_scroll_text;
  String get introduction_screen_letter_page_hi;
}

class KoreanLocalizations implements Localizations{
  @override
  String get introduction_screen_greeting_page_scroll_text => '아래로 스크롤해주세요.';

  @override
  String get introduction_screen_letter_page_hi => '안녕하세요';

}

class EnglishLocalizations implements Localizations{
  @override
  String get introduction_screen_greeting_page_scroll_text => 'Please scroll down';

  @override
  String get introduction_screen_letter_page_hi => 'hi';


}
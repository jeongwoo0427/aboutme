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
  String get introduction_screen_letter_page_letter;
}

class KoreanLocalizations implements Localizations{
  @override
  String get introduction_screen_greeting_page_scroll_text => '아래로 스크롤해주세요.';

  @override
  String get introduction_screen_letter_page_hi => '안녕하세요';

  @override
  // TODO: implement introduction_screen_letter_page_letter
  String get introduction_screen_letter_page_letter => 'Flutter로 세상을 그려내는 개발자입니다.\n\n'
      '코드 한 줄에 감성을 담아 iOS와 Android라는 두 개의 무대 위에 하나의 아름다운 공연을 펼칩니다.\n\n'
      '새로운 기술과 도전을 사랑하며, 매일 더 나은 소프트웨어라는 꿈을 꿉니다.';

}

class EnglishLocalizations implements Localizations{
  @override
  String get introduction_screen_greeting_page_scroll_text => 'Please scroll down';

  @override
  String get introduction_screen_letter_page_hi => 'hi';

  @override
  // TODO: implement introduction_screen_letter_page_letter
  String get introduction_screen_letter_page_letter => 'I am a developer painting the world with Flutter.\n\n'
      'Each line of code carries a touch of emotion, crafting a single beautiful performance on the dual stages of iOS and Android. \n\n'
      'I embrace new technologies and challenges, dreaming each day of creating better software.';


}
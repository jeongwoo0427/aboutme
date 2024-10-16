import 'package:aboutme/constants/app_constants.dart';
import 'package:aboutme/cores/mixins/validator_mixin.dart';


class AppLocalizations{

  static final KoreanLocalizations koreanLocalizations = KoreanLocalizations();
  static final EnglishLocalizations englishLocalizations = EnglishLocalizations();

  static Localizations get(Language code){
    if(code == Language.kr) {
      return koreanLocalizations;
    }else if(code== Language.en){
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
  String get contact_message_input_label;
  String get contact_mycontact_input_label;
  String get validation_error_contact_message_is_empty;
  String get validation_error_contact_mycontact_is_empty;
  String get validation_error_contact_mycontact_is_too_long;
  String get projects_details_project_date;
  String get projects_details_use_skills;
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

  @override
  // TODO: implement contact_message_input_label
  String get contact_message_input_label => '남기실 메시지';

  @override
  // TODO: implement contact_mycontact_input_label
  String get contact_mycontact_input_label => '이메일 또는 연락처';

  @override
  // TODO: implement validation_error_contact_message_is_empty
  String get validation_error_contact_message_is_empty => '메시지를 입력해주세요.';

  @override
  // TODO: implement validation_error_contact_mycontact_is_empty
  String get validation_error_contact_mycontact_is_empty => '연락처를 입력해주세요.';

  @override
  // TODO: implement validation_error_contact_mycontact_is_too_long
  String get validation_error_contact_mycontact_is_too_long => '연락처는 최대 ${ValidatorConstants.contactMyContactMaxLength}글자 이하입니다.';

  @override
  // TODO: implement projects_details_project_date
  String get projects_details_project_date => '기간';

  @override
  // TODO: implement projects_details_use_skills
  String get projects_details_use_skills =>'스택';

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

  @override
  // TODO: implement contact_message_input_label
  String get contact_message_input_label => 'Message';

  @override
  // TODO: implement contact_mycontact_input_label
  String get contact_mycontact_input_label => 'Your Contact information';

  @override
  // TODO: implement validation_error_contact_message_is_empty
  String get validation_error_contact_message_is_empty => 'Please enter the Message';

  @override
  // TODO: implement validation_error_contact_mycontact_is_empty
  String get validation_error_contact_mycontact_is_empty => 'Please enter here';

  @override
  // TODO: implement validation_error_contact_mycontact_is_too_long
  String get validation_error_contact_mycontact_is_too_long => 'Contact information max length is ${ValidatorConstants.contactMyContactMaxLength}';

  @override
  // TODO: implement projects_details_project_date
  String get projects_details_project_date => 'Period';

  @override
  // TODO: implement projects_details_use_skills
  String get projects_details_use_skills => 'Skills';


}
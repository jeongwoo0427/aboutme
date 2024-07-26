import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:validators/validators.dart';

import '../utils/shared_utility.dart';
class ValidatorConstants{
  static const int emailMaxLength = 50;
  static const int emailMinLength = 5;

  static const int passwordMaxLength = 20;
  static const int passwordMinLength = 8;

  static const int nicknameMaxLength = 30;
  static const int nicknameMinLength = 2;


  static const int nameMaxLength = 12;
  static const int nameMinLength = 1;

  static const int phoneNumMaxLength = 11;
  static const int phoneNumMinLength = 11;



  static const int descMaxLength = 100;


  static const int trainingTitleMaxLength = 30;
  static const int trainingTitleMinLength = 1;



  static const int boardcastTitleMaxLength = 50;
  static const int boardcastTitleMinLength = 1;

  static const int boardcastContentMaxLength = 300;
  static const int boardcastContentMinLength = 1;

  static const int boardcastGroupTitleMaxLength = 200;
  static const int boardcastGroupTitleMinLength = 1;


}

mixin ValidatorMixin{

  final validationKey = GlobalKey<FormState>();
  final SharedUtility utility = SharedUtility();


  bool checkValidate(){
    return validationKey.currentState!.validate();
  }
  //
  // String? emailValidation(final BuildContext context,final value){
  //   if(value.toString().trim() =='') return context.localizations.validation_message_email_required;
  //   if(!isEmail(value.toString().trim())) return context.localizations.validation_message_email_is_not_valid;
  //   ///TODO: 공백및 특수문자 여부 확인하기
  //   if(value.toString().length > ValidatorConstants.emailMaxLength)return  utility.convertLocalizationVariables(text: context.localizations.validation_message_email_max_is,variables: [ValidatorConstants.emailMaxLength,]);
  //   if(value.toString().length < ValidatorConstants.emailMinLength)return  utility.convertLocalizationVariables(text: context.localizations.validation_message_email_min_is,variables: [ValidatorConstants.emailMinLength,]);
  //
  //   return null;
  // }
  //
  // String? passwordValidation(final BuildContext context,final value){
  //   if(value.toString().trim() =='') return context.localizations.validation_message_password_required;
  //
  //   ///TODO: 공백및 특수문자 여부 확인하기
  //   if(value.toString().length > ValidatorConstants.passwordMaxLength)return  utility.convertLocalizationVariables(text: context.localizations.validation_message_password_max_is,variables: [ValidatorConstants.passwordMaxLength,]);
  //   if(value.toString().length < ValidatorConstants.passwordMinLength)return  utility.convertLocalizationVariables(text: context.localizations.validation_message_password_min_is,variables: [ValidatorConstants.passwordMinLength,]);
  //
  //   return null;
  // }
  //
  // String? password2Validation(final BuildContext context,final value,final value2){
  //   if(value.toString().trim()== '')return utility.convertLocalizationVariables(text: context.localizations.validation_message_password_check_enter_please);
  //   ///TODO: 공백및 특수문자 여부 확인하기
  //   if(value!=value2)return utility.convertLocalizationVariables(text: context.localizations.validation_message_password_check_wrong_each);
  //
  //   return null;
  // }
  //
  // String? nicknnameValidation(final BuildContext context,final value){
  //   if(value.toString().trim()== '')return context.localizations.validation_message_nickname_required;
  //   ///TODO: 공백및 특수문자 여부 확인하기
  //   if(value.toString().length > ValidatorConstants.nicknameMaxLength)return utility.convertLocalizationVariables(text: context.localizations.validation_message_nickname_max_is, variables: [ValidatorConstants.nicknameMaxLength]);
  //   if(value.toString().length < ValidatorConstants.nicknameMinLength)return utility.convertLocalizationVariables(text: context.localizations.validation_message_nickname_min_is, variables: [ValidatorConstants.nicknameMinLength]);
  //   return null;
  // }
}
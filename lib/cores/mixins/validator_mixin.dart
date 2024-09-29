import 'package:aboutme/cores/extensions/widget_ref_extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:validators/validators.dart';

import '../utils/shared_utility.dart';
class ValidatorConstants{
  static const int emailMaxLength = 50;
  static const int emailMinLength = 5;




}

mixin ValidatorMixin{

  final validationKey = GlobalKey<FormState>();
  final SharedUtility utility = SharedUtility();


  bool checkValidate(){
    return validationKey.currentState!.validate();
  }

  String? contactMessageValidation(final WidgetRef ref,final value){
    if(value==null || value.toString().trim()== '')return ref.localizations.validation_error_contact_message_is_empty;
    return null;
  }

  String? contactMyContactValidation(final WidgetRef ref,final value){
    if(value==null || value.toString().trim()== '')return ref.localizations.validation_error_contact_mycontact_is_empty;
    if(value.toString().length > 200) return ref.localizations.validation_error_contact_mycontact_is_too_long;

    return null;
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
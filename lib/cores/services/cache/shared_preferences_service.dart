
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService{

  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  SharedPreferencesService._internal();

  factory SharedPreferencesService(){
    return _instance;
  }

  // 초기화 변수를 받아오는 생성자
  factory SharedPreferencesService.initialize(SharedPreferences sharedPreferences){
    _instance._initialize(sharedPreferences);
    return _instance;
  }


  //멤버변수
  late final SharedPreferences _preferences;

  //멤버변수를 초기화하는 함수
  void _initialize(SharedPreferences sharedPreferences) {
    _preferences = sharedPreferences;
  }



  ThemeMode getThemeMode() {
    ThemeMode themeMode;
    switch (_preferences.getString('themeMode') ??'light') {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      case 'system':
        themeMode = ThemeMode.system;
        break;
      default:
        themeMode = ThemeMode.system;
        break;
    }
    return themeMode;
  }

  Future<void> setThemeMode({required ThemeMode themeMode}) async{
    String themeString;
    switch (themeMode) {
      case ThemeMode.light:
        themeString = 'light';
        break;
      case ThemeMode.dark:
        themeString = 'dark';
        break;
      case ThemeMode.system:
        themeString = 'system';
        break;
      default:
        themeString = 'system';
        break;
    }
    await _preferences.setString('themeMode', themeString);
  }

  ///Refresh Token의 존재 유무에 따라 로그인여부가 달라짐
  String? getRefreshToken(){
    return _preferences.getString('refreshToken');
  }

  Future<void> setRefreshToken(String refreshToken) async {
    await _preferences.setString('refreshToken', refreshToken);
  }
}
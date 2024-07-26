import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class SharedUtility {
  static SharedUtility _instance = SharedUtility._internal();

  factory SharedUtility() {
    return _instance;
  }

  SharedUtility._internal();

  final _dateFormatter = DateFormat('yyyy-MM-dd');
  final _dateFormatter2 = DateFormat('yyyy/MM/dd');
  final _datetimeFormatter = DateFormat('yyyy-MM-dd HH:mm:ss');

  String convertLocalizationVariables(
      {required String text, List<dynamic> variables = const []}) {
    ///각 지정변수는 @v1@, @v2@ 등으로 표기
    String result = text;
    for(int i = 0; i < variables.length; i++){
      result = result.replaceAll('@v$i@', variables[i].toString());
    }
    return result;
  }

  String intToTimeLeft(int value) {
    int h, m, s;

    h = value ~/ 3600;

    m = ((value - h * 3600)) ~/ 60;

    s = value - (h * 3600) - (m * 60);

    String hourLeft = h
        .toString()
        .length < 2 ? "0" + h.toString() : h.toString();

    String minuteLeft = m
        .toString()
        .length < 2 ? "0" + m.toString() : m.toString();

    String secondsLeft = s
        .toString()
        .length < 2 ? "0" + s.toString() : s.toString();

    String result = "$minuteLeft:$secondsLeft";

    return result;
  }

  String timeToFormattedString(TimeOfDay time) {
    String hour = '';
    String minute = '';
    if (time.hour >= 10) {
      hour = time.hour.toString();
    } else {
      hour = '0' + time.hour.toString();
    }

    if (time.minute >= 10) {
      minute = time.minute.toString();
    } else {
      minute = '0' + time.minute.toString();
    }
    return hour + ':' + minute;
  }

  TimeOfDay stringToTime(String timeString) {
    List<String> splited = timeString.split(':');
    return TimeOfDay(
        hour: int.parse(splited[0]), minute: int.parse(splited[1]));
  }

  String getRandomNumbers(int length) {
    String _authNum = '';
    var rng = new Random();
    for (int i = 0; i < length; i++) {
      _authNum += rng.nextInt(9).toString();
    }
    return _authNum;
  }

  String themeToString(ThemeMode themeMode) {
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
    return themeString;
  }

  String stringFromDate(DateTime? dt) {
    if (null == dt) return '';
    return _dateFormatter.format(dt);
  }

  DateTime? dateFromString(String? str) {
    if (null == str || str.isEmpty) return null;

    if (10 == str.length) {
      return DateTime.tryParse('$str 00:00:00.000') ?? null;
    }
    return DateTime.tryParse(str) ?? null;
  }

  ThemeMode stringToTheme(String themeString) {
    ThemeMode themeMode;
    switch (themeString) {
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

  String easyTimeConverter(DateTime dateTime) {
    DateTime curTime = DateTime.now();

    Duration timeDiff = curTime.difference(dateTime);
    if (timeDiff.inMinutes < 1) {
      return '방금전';
    } else if (timeDiff.inHours < 1) {
      return timeDiff.inMinutes.toString() + '분 전';
    } else if (timeDiff.inDays < 1) {
      return timeDiff.inHours.toString() + '시간 전';
    } else if (timeDiff.inDays < 30) {
      return timeDiff.inDays.toString() + '일 전';
    } else {
      return dateTime.toString().trim().substring(0, 11);
    }

    return '';
  }

  Future<String?> getPublicIP() async {
    try {
      const url = 'https://api.ipify.org';
      var response = await Dio().request(url,options:Options(method: 'GET',sendTimeout: const Duration(seconds: 2),receiveTimeout: const Duration(seconds: 2),));
      if (response.statusCode == 200) {
        // The response body is the IP in plain text, so just
        // return it as-is.
        return response.data;
      } else {
        // The request failed with a non-200 code
        // The ipify.org API has a lot of guaranteed uptime
        // promises, so this shouldn't ever actually happen.
        print(response.statusCode);
        print(response.data);
        return null;
      }
    } catch (e) {
      // Request failed due to an error, most likely because
      // the phone isn't connected to the internet.
      print(e);
      return null;
    }
  }
}

import 'dart:developer';


import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import 'exception_handler_result.dart';
import 'exceptions/custom_exception.dart';
import 'filters/dio_exception_filter.dart';
import 'filters/exception_filter.dart';

///각종 오류가 발생했을때 메시지 선별, 오류 로깅, 데이터 변환 등을 맡는다.
class ExceptionHandler {
  static ExceptionHandlerResult handlingException(
      BuildContext context, ex, stack) {
    if (kDebugMode) {
      var logger = Logger();
      logger.e(StackTrace.current,
          error: ex, stackTrace: stack, time: DateTime.now());
    }

    String type = ExceptionResultTypes.UNDEFINED;
    String title = 'Error';
    String message;

    ///아래 모든 예외들은 Exception을 implement했기 때문에 ex is Exception 체크가 먼저 와야한다.
    if (ex is Exception) type = ExceptionFilter.parse(ex);

    if (ex is DioException) type = DioExceptionFilter.parse(ex);

    if (ex is CustomException) type = ExceptionResultTypes.CUSTOM;

    message = _convertStaticMessage(context, type: type);

    //message = '$message [$type]';

    if (type == ExceptionResultTypes.CUSTOM) {
      final CustomException customException = ex as CustomException;
      title =
          customException.title ?? 'Warning';
      message = customException.message;
    }

    ExceptionHandlerResult result = ExceptionHandlerResult(
        exceptionResultType: type,
        title: title,
        message: message,
        exception: ex,
        stackTrace: stack);
    return result;
  }

  static String _convertStaticMessage(BuildContext context,
      {required String type}) {
    String message = 'Exception Message Undefined.';

    if (type == ExceptionResultTypes.HTTP_NOT_FOUND) {
      message = 'HTTP Error : Not found.';
    }

    if (type == ExceptionResultTypes.HTTP_INTERNAL_SERVER_ERROR) {
      message = 'HTTP Error : Internal server error.';
    }

    if (type == ExceptionResultTypes.HTTP_CONNECTION_ERROR) {
      message = 'HTTP Error : Connection error.';
    }

    if (type == ExceptionResultTypes.HTTP_CONNECTION_TIMEOUT) {
      message = 'HTTP Error : Connection timeout.';
    }

    if (type == ExceptionResultTypes.HTTP_UNAUTHORIZED_JWT) {
      message = 'HTTP Error : Unauthorized Token';
    }

    if (type == ExceptionResultTypes.HTTP_UNAUTHORIZED_KEY) {
      message = 'HTTP Error : Unauthorized Key';
    }

    if (type == ExceptionResultTypes.HTTP_UNAUTHORIZED_UNKNOWN) {
      message = 'HTTP Error : Unauthorized';
    }

    if (type == ExceptionResultTypes.UNKNOWN) {
      //확인할 수 없는 오류가 발생했습니다.
      message = 'HTTP Error : Unknown error';
    }

    return message;
  }
}

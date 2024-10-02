
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

import '../exception_handler_result.dart';

///각종 오류가 발생했을때
class DioExceptionFilter {
  static String parse(DioException ex) {
    if(kDebugMode) {
      var logger = Logger();
      logger.d(ex.response?.data.toString()??'UNKNOWN');
    }
    if(ex.type == DioExceptionType.badResponse){
      final statusCode = ex.response?.statusCode;
      if(statusCode == 401) {
        if(ex.response?.data['response']?['type'] == 'JWT_TOKEN'){
          return ExceptionResultTypes.HTTP_UNAUTHORIZED_JWT;
        }
        if(ex.response?.data['response']?['type'] == 'PUBLIC_API_KEY'){
          return ExceptionResultTypes.HTTP_UNAUTHORIZED_KEY;
        }else{
          return ExceptionResultTypes.HTTP_UNAUTHORIZED_UNKNOWN;
        }
      }
      if(statusCode == 400) return ExceptionResultTypes.HTTP_BAD_REQUEST;
      if(statusCode == 404) return ExceptionResultTypes.HTTP_NOT_FOUND;
      if(statusCode == 500) return ExceptionResultTypes.HTTP_INTERNAL_SERVER_ERROR;
    }
    if(ex.type == DioExceptionType.connectionError) return ExceptionResultTypes.HTTP_CONNECTION_ERROR;
    if(ex.type == DioExceptionType.connectionTimeout) return ExceptionResultTypes.HTTP_CONNECTION_TIMEOUT;

    return ExceptionResultTypes.UNKNOWN;
  }
}
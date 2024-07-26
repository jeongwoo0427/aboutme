import '../exception_handler_result.dart';

///각종 오류가 발생했을때
class ExceptionFilter {
  static String parse(Exception ex) {

    return ExceptionResultTypes.CUSTOM;
  }
}
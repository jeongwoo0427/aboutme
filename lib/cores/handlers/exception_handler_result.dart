///이 객체는 사용자 인터페이스 작동 도중 발생한 오류에 표시해야 할 메시지의 코드를 포함
class ExceptionHandlerResult {
  final String exceptionResultType;
  final String title;
  final String message;
  final exception;
  final StackTrace stackTrace;

  ExceptionHandlerResult(
      {required this.exceptionResultType,
      required this.title,
      required this.message,
      required this.exception,
      required this.stackTrace});
}

//사용자 인터페이스에 표시하기 위한 예외 메시지 타입들
class ExceptionResultTypes {
  ///HTTP FAILED
  static const String HTTP_NOT_FOUND = 'HTTP_NOT_FOUND';
  static const String HTTP_INTERNAL_SERVER_ERROR = 'HTTP_INTERNAL_SERVER_ERROR';
  static const String HTTP_CONNECTION_ERROR = 'HTTP_CONNECTION_ERROR';
  static const String HTTP_CONNECTION_TIMEOUT = 'HTTP_CONNECTION_TIMEOUT';
  static const String HTTP_UNAUTHORIZED_JWT = 'HTTP_UNAUTHORIZED_JWT';
  static const String HTTP_UNAUTHORIZED_KEY = 'HTTP_UNAUTHORIZED_KEY';
  static const String HTTP_UNAUTHORIZED_UNKNOWN = 'HTTP_UNAUTHORIZED_UNKNOWN';

  ///AUTH FAILED
  static const String AUTH_LOGIN_FAILED = 'AUTH_LOGIN_FAILED';
  static const String AUTH_WRONG_EMAIL = 'AUTH_WRONG_EMAIL';
  static const String AUTH_WRONG_PASSWORD = 'AUTH_WRONG_PASSWORD';
  static const String AUTH_EXPIRED = 'AUTH_EXPIRED';
  static const String AUTH_VERIFY_FAILED = 'AUTH_VERIFY_FAILED';
  static const String AUTH_TOKEN_NOT_EXISTS = 'AUTH_TOKEN_NOT_EXISTS';
  static const String AUTH_TOKEN_NOT_ACTIVATED = 'AUTH_TOKEN_NOT_ACTIVATED';

  /// ETC..
  static const String CUSTOM =
      'CUSTOM'; //원하는 메시지를 서버 또는 다른 서비스에 의해 표시하고 싶을때 exception을 직접 표시한다.
  static const String UNKNOWN = 'UNKNOWN';
  static const String UNDEFINED = 'UNDEFINED'; // 처음부터 정의되지 않은 오류일떄
}

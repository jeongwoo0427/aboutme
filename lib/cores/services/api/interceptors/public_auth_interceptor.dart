import 'package:dio/dio.dart';

class PublicAuthInterceptor implements Interceptor {
  static const String _API_KEY =
      'iej833kj34idridf09iDKJ9we121312wqsdasfwpod03120kljdfoid8w3hoshjlkcjlcvjoeiwekrkjoif8e3kncmncvilqwiejkjlkjdeieiweiu8';

  PublicAuthInterceptor();

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    return handler.next(err);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers['public-key'] = _API_KEY;
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    handler.next(response);
  }
}

import 'package:dio/dio.dart';

///규격에 맞게 개발된 Service 객체
class APIService {
  final Dio dio;

  static const String baseUrl = 'https://clipboardfor.me:3030';

  static final APIService _instance = APIService._internal();

  factory APIService() {
    return _instance;
  }

  APIService._internal() //DIO 싱글톤으로 관리
      : dio = Dio(BaseOptions(
            baseUrl: baseUrl,
            receiveTimeout: const Duration(seconds: 5),
            connectTimeout: const Duration(seconds: 5)));

  Future<dynamic> request(String pathString,
      {String method = 'GET',
      String contentType = 'application/json',
      Map<String, String> headers = const { },
      dynamic data,
      Iterable<Interceptor> interceptors = const []}) async {

    try{
      dio.options.headers['content-Type'] = contentType;
      dio.options.headers.addAll(headers);
      dio.options.method = method;
      dio.interceptors.clear();
      dio.interceptors.addAll([...interceptors]);

      final response = await dio.request(pathString, data: data);


      return response.data['_data'];
    }catch(ex){
      //rethrow;
      throw ex; //rethrow 를 사용할 경우 StackTrace 추적이 어려움
    }

  }
}

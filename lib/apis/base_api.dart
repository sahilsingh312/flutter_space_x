import 'package:dio/dio.dart';

class BaseApi {
  final Dio _dio = Dio();
  String _baseUrl = "";

  BaseApi({required String baseUrl}) {
    _baseUrl = baseUrl ?? _baseUrl;
    _dio.options.baseUrl = _baseUrl;
    _dio.options.connectTimeout = 5000;
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        return handler.next(options);
      },
      onResponse:
          (Response response, ResponseInterceptorHandler handler) async {
        return handler.next(response);
      },
      onError: (DioError e, ErrorInterceptorHandler handler) async {
        return handler.next(e);
      },
    ));
  }
  Future<Response> get(String path) async {
    try {
      final response = await _dio.get(path);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

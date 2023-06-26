import 'package:dio/dio.dart';

import 'interceptor/http_interceptors.dart';

class HttpClient {
  late Dio _dio;

  HttpClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: DioBaseOptions.baseUrl,
        receiveTimeout: DioBaseOptions.receiveTimeout,
        connectTimeout: DioBaseOptions.connectTimeout,
      ),
    )..interceptors.add(HttpInterceptor());
  }

  Future<Response<T>> get<T>(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.get<T>(url, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> post<T>(String url,
      {data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.post<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> put<T>(String url,
      {data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.put<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> patch<T>(String url,
      {data, Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.patch<T>(url,
        data: data, queryParameters: queryParameters, options: options);
  }

  Future<Response<T>> delete<T>(String url,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.delete<T>(url,
        queryParameters: queryParameters, options: options);
  }

  Future<Response> download(String url, String savePath,
      {Map<String, dynamic>? queryParameters, Options? options}) {
    return _dio.download(url, savePath,
        queryParameters: queryParameters, options: options);
  }
}

class DioBaseOptions {
  static String baseUrl = 'https://api.spotify.com';

  static const int connectTimeout = 10000;

  static const int receiveTimeout = 100000;
}

import 'package:dio/dio.dart';
import 'package:flutter_nusacodes_2/data/local_storage/auth_local_storage.dart';
import 'package:flutter_nusacodes_2/data/remote_data/network_service/network_exception.dart';
import 'package:flutter_nusacodes_2/helpers/logging_interceptor.dart';

class NetworkService {

  final requestTimeOut = 30;
  
  late Dio dio;
  late final AuthLocalStorage authStorage;

  NetworkService(this.authStorage) {
    final baseOptions = BaseOptions(
      baseUrl: 'https://nginfoin.my.id/public',
      connectTimeout: Duration(seconds: requestTimeOut),
      receiveTimeout: Duration(seconds: requestTimeOut),
      responseType: ResponseType.json,
      followRedirects: true,
    );

    dio = Dio(baseOptions);
    dio.interceptors.add(LoggingInterceptor());
  }

  Future<Map<String, dynamic>> headersRequest() async {
    final token = authStorage.getToken();
    return {
      'Content-Type': 'application/json',
      'Authorization': "Bearer $token",
      'Accept': 'application/json',
    };
  }

  Future<Response> get({
    required String url,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.get(
      url,
      queryParameters: queryParameters ?? {},
      options: Options(headers: header),
    ));
  }

  Future<Response> post({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.post(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters
    ));
  }

  Future<Response> put({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.put(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> patch({
    required String url,
    Map<String, dynamic>? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.patch(
      url,
      data: data,
      options: Options(headers: header),
      queryParameters: queryParameters,
    ));
  }

  Future<Response> delete({
    required String url,
    Map<String, dynamic>?  data,
    Map<String, dynamic>? parameters,
  }) async {
    final header = await headersRequest();
    return await _safeFetch(() => dio.delete(
      url,
      data: data,
      queryParameters: parameters,
      options: Options(headers: header),
    ));
  }

  Future<Response> _safeFetch(Future<Response> Function() tryFetch) async {
    try {
      final response = await tryFetch();
      return response;
    } on DioException catch (dioError) {
      switch (dioError.type) {
        case DioExceptionType.connectionTimeout:
          throw NetworkException(message: "Connection Time Out");
        case DioExceptionType.sendTimeout:
          throw NetworkException(message: "Request Time Out");
        case DioExceptionType.receiveTimeout:
          throw NetworkException(message: "Response Time Out");
        case DioExceptionType.badResponse:
          throw NetworkException(response: dioError.response);
        default:
          throw NetworkException();
      }
    } catch (e) {
      throw NetworkException(message: e.toString());
    }
  }
}

import 'package:dio/dio.dart';

class NetworkException implements Exception {
  final Response? response;
  final String? message;

  NetworkException({
    this.response,
    this.message,
  });

  @override
  String toString() {
    if(response != null) {
      if(response!.statusCode! >= 400 && response!.statusCode! < 500) {
        return response?.data?['message'];
      } else if(response!.statusCode! >= 500) {
        return 'Internal Server Error';
      }
    }
    return message ?? "Network Error";
  }
}
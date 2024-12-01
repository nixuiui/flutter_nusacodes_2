import 'dart:developer';

import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) {
    log('\n');
    log('-----START REQUEST-----');
    log('${options.method.toUpperCase()}: ${'${options.baseUrl}${options.path}'}');
    log('Headers: ${options.headers}');
    log('QueryParameters: ${options.queryParameters}');
    if (options.data != null) {
      log('Body: ${options.data.toString()}');
    }
    log('-----END REQUEST-----');
    log('\n');
    handler.next(options);
  }

  @override
  void onError(
    DioException err, 
    ErrorInterceptorHandler handler
  ) {
    log('\n');
    log('-----START ERROR-----');
    log('${err.message} ${err.response?.requestOptions != null ? (err.response!.requestOptions.baseUrl + err.response!.requestOptions.path) : 'URL'}');
    log('${err.response != null ? err.response!.data : 'Unknown Error'}');
    log('-----END ERROR-----');
    log('\n');
    handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response, 
    ResponseInterceptorHandler handler
  ) {
    log('\n');
    log('-----START RESPONSE-----');
    log('STATUS CODE: ${response.statusCode}, URL: ${response.requestOptions.baseUrl}${response.requestOptions.path}');
    printWrapped('RESPONSE: ${response.data}');
    log('-----END RESPONSE-----');
    handler.next(response);
  }

  void printWrapped(String text) {
    final pattern = RegExp('.{1,800}');
    pattern.allMatches(text).forEach((RegExpMatch match) => log(match.group(0).toString()));
  }
}

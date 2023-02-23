import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
final dioProvider = Provider((_) => AppDio.getInstance());
class AppDio with DioMixin implements Dio {
  final String tag = "API call :";
  AppDio._([BaseOptions? options]) {
    options = BaseOptions(
      baseUrl: "http://crm.bemlindia.in/bemlquality/modules/Mobile/v1",
      contentType: 'application/json',
      // connectTimeout: 30000,
      // sendTimeout: 30000,
      // receiveTimeout: 30000,
    );

    this.options = options;
    interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      handler.next(options);
    }));

    if (kDebugMode) {
      interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
    }
    // if (kIsWeb) {
    //   httpClientAdapter = getAdapter();
    // } else {
    //   httpClientAdapter = getAdapter();
    // }
  }
  static AppDio getInstance() => AppDio._();

  factory AppDio() {
    return getInstance();
  }
}
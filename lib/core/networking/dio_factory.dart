import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  DioFactory._();

  static Dio? dio;

  static Dio init() {
    Duration timeout = const Duration(seconds: 120);
    dio ??= Dio()
      ..options.connectTimeout = timeout
      ..options.receiveTimeout = timeout
      ..options.headers = {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      }
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            // Note: TMDB API key is now passed as query parameter in individual service calls
            handler.next(options);
          },
        ),
      )
      ..interceptors.add(
        PrettyDioLogger(
          requestBody: true,
          requestHeader: true,
          responseHeader: true,
          responseBody: true,
        ),
      );
    return dio!;
  }
}

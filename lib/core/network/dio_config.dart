import 'package:dio/dio.dart';

import '../utils/constant/constant.dart';

class DioConfig {
  static Dio createDio() {
    final Dio dio = Dio();

    dio.options = BaseOptions(
        baseUrl: Constants.serverUrlDio, connectTimeout: const Duration(seconds: 10), receiveTimeout: const Duration(seconds: 10));

    return dio;
  }
}

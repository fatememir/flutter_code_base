import 'package:dio/dio.dart';

import '../utils/constant/constant.dart';

class DioConfig {
  static Dio createDio() {
    final Dio dio = Dio();

    dio.options = BaseOptions(
      baseUrl: Constants.serverUrlDio,
    );
    return dio;
  }
}

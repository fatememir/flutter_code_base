import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../network/dio_config.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio get httpClient => DioConfig.createDio()..interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
        // options.headers['Authorization'] = authInfo;

      handler.next(options);
    },
  ));
}

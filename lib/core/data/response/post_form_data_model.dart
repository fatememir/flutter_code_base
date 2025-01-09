import 'package:dio/dio.dart';

import '../../utils/constant/constant.dart';
import '../api_error.dart';
import '../api_result.dart';
extension DioExtensions on Dio {
  Future<ApiResult<T>> safePostFormData<T>(
      String path, T Function(Map<String, dynamic>) mapper,
      {data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress}) async {
    try {

      FormData formData=await FormData.fromMap(data);
      final response = await post(Constants.serverUrlDio+path,
          data: formData,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      print("post form data res= "+response.toString());

      return ApiResult.fromResponse(response, mapper);
    } on DioException catch (exception) {
      return NetworkError(List.filled(
          1,
          ApiError(
              code: exception.response?.statusCode,
              message: exception.message!),
          growable: false));
    }
  }
}

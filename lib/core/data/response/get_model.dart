import 'package:dio/dio.dart';
import '../../../main.dart';
import '../../utils/constant/constant.dart';
import 'package:flutter/material.dart';

import '../../widgets/top_snack_bar.dart';
import '../../widgets/custom_snack_bar.dart';

extension DioExtensions on Dio {
  Future<T> safeGet<T>(
      String path,
      T Function(dynamic json) mapper, {
        required BuildContext context, // Add BuildContext as a required parameter
        dynamic data,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    Options? options;

    try {
      final response = await get(
        Constants.serverUrlDio + path,
        data: data,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );

      if (response.statusCode == 200) {
        return mapper(response.data);
      } else {
        _showSnackbar(context, 'Error: ${response.statusCode}');
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      if (e.response != null) {
        _showSnackbar(context, 'DioException: ${e.response?.data}');
      } else {
        _showSnackbar(context, 'DioException without response: $e');
      }
      rethrow;
    } catch (e) {
      _showSnackbar(context, 'Unexpected error: $e');
      rethrow;
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    showTopSnackBar(
      context,
      CustomSnackBar.info(message: message),
    );
  }
}


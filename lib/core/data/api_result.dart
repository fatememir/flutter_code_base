import 'package:dio/dio.dart';

import 'api_error.dart';

abstract class ApiResult<T> {

  static const String _jsonNodeData = "data";
  static const String _jsonNodeErrors = "error";
  static const String _jsonNodeStatus = "status";
  static const String _jsonNodeMessage = "message";

  static ApiResult<T> fromResponse<T>(
      Response response,  dynamic mapper) {
    final responseData = response.data;

    if (responseData[_jsonNodeErrors] != null) {
      return ServerError.fromResponse(response);
    } else if (responseData[_jsonNodeData] != null) {
      print("succ ${response.data[_jsonNodeData]}");
      return Success(
          mapper(response.data[_jsonNodeData]),
          responseData[_jsonNodeMessage] ?? "Unknown",
          responseData[_jsonNodeStatus] ?? false);
    }else if(responseData[_jsonNodeData] == null){
      print("data is null");
      return Success(
          null,
          responseData[_jsonNodeMessage] ?? "Unknown",
          responseData[_jsonNodeStatus] ?? false);
    }

    else {
      return InternalError();
    }
  }
}


class Success<T> extends ApiResult<T> {
  final T? data;
  final String message;
  final bool status;

  Success(this.data, this.message, this.status);

}
class Failed<T> extends ApiResult<T> {
  List<ApiError>? errors;

  Failed(
      this.errors,
      );
}


class ServerError<T> extends Failed<T> {
  static const String _jsonNodeErrors = "error";
  final String message;
  final bool status;

  ServerError(
      super.errors,
      this.message,
      this.status,
      );

  static ServerError<T> fromResponse<T>(Response response) {
    return ServerError(
        (response.data[_jsonNodeErrors] as List)
            .map((e) => ApiError.fromJson(e))
            .toList(),
        response.data["message"],
        response.data["status"]);
  }
}
class InternalError<T> extends Failed<T> {
  InternalError() : super(List.empty());
}

class NetworkError<T> extends Failed<T> {
  NetworkError(super.errors);
}

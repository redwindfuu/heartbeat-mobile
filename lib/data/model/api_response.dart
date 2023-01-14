import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:logger/logger.dart';

part 'api_response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool isServerError;
  final bool? status;

  @JsonKey(name: 'err_code')
  final int? errorCode;
  final String? message;
  final T? data;

  ApiResponse({
    this.isServerError = false,
    this.status,
    this.errorCode,
    this.message,
    this.data,
  });

  factory ApiResponse.fromJson(Map<String, dynamic> json, T Function(Object? json) fromJsonT) => _$ApiResponseFromJson(json, fromJsonT);

  factory ApiResponse.fromException(ex) {
    Logger().e(ex);

    bool? status;
    String? mess;

    if (ex is DioError) {
      Logger().d(ex.response?.data);

      String message = "unknown_error";
      switch (ex.type) {
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.connectTimeout:
        case DioErrorType.response:
        case DioErrorType.other:
        case DioErrorType.cancel:
          message = ex.error.toString();
          break;
        default:
          message = "cannot_connect_server";
          break;
      }
      mess = message;
    }
    return ApiResponse(
      message: mess,
      status: status,
    );
  }
}

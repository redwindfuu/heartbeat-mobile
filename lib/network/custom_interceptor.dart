import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

class CustomInterceptor extends InterceptorsWrapper{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Map<String, dynamic> headers = {
      "Connection": "Keep-Alive",
      "Keep-Alive": "timeout=5, max=1000",
    };
    options.headers.addAll(headers);
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async{
    Logger().i(err.message);
    return handler.resolve(
    err.response ?? Response(requestOptions: err.requestOptions));
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }
}

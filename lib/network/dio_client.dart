import 'package:dio/dio.dart';

import '../data/remote/end_point.dart';
import 'custom_interceptor.dart';
import 'pretty_dio_logger.dart';

class DioClient {
  static DioClient instance = DioClient._internal();

  late Dio dio;
  final _option = BaseOptions(
    baseUrl: EndPoint.baseURL,
    connectTimeout: 60 * 1000,
    receiveTimeout: 60 * 1000,
    responseType: ResponseType.json,
  );

  DioClient._internal() {
    dio = Dio(_option);
    dio.interceptors.add(CustomInterceptor());
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));
  }
}

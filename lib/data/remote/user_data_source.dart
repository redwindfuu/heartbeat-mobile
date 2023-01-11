import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/api_response.dart';
import 'end_point.dart';

part 'user_data_source.g.dart';

@RestApi()
abstract class UserDataSource {
  factory UserDataSource(Dio dio, {String baseUrl}) = _UserDataSource;

  @POST(EndPoint.getUserInfo)
  Future<ApiResponse> getUserInfo();
}
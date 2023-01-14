import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/api_response.dart';
import '../model/get_heart_beat_response.dart';
import '../model/login_response.dart';
import 'end_point.dart';

part 'data_source.g.dart';

@RestApi()
abstract class DataSource {
  factory DataSource(Dio dio, {String baseUrl}) = _DataSource;

  @POST(EndPoint.register)
  Future<ApiResponse> register(@Body() Map<String, dynamic> req);

  @POST(EndPoint.login)
  Future<ApiResponse<LoginResponse>> login(@Body() Map<String, dynamic> req);

  @GET(EndPoint.getHeartBeat)
  Future<ApiResponse<GetHeartBeatResponse>> getHeartBeat(@Queries() Map<String, dynamic> req);
}

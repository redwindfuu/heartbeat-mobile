import '../model/api_response.dart';
import '../model/get_heart_beat_response.dart';
import '../model/login_response.dart';
import '../model/post_heart_beat_response.dart';

abstract class Repository {
  Future<ApiResponse> register(Map<String, dynamic> req);
  Future<ApiResponse<LoginResponse>> login(Map<String, dynamic> req);
  Future<ApiResponse<GetHeartBeatResponse>> getHeartBeat(Map<String, dynamic> req);
  Future<ApiResponse<PostHeartBeatResponse>> postHeartBeat(Map<String, dynamic> req);
}

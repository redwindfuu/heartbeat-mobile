import '../model/api_response.dart';
import '../model/login_response.dart';

abstract class Repository{
  Future<ApiResponse> register(Map<String, dynamic> req);
  Future<ApiResponse<LoginResponse>> login(Map<String, dynamic> req);
}
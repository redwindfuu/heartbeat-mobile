import '../model/api_response.dart';

abstract class UserRepository{
  Future<ApiResponse> getUserInfo();
}
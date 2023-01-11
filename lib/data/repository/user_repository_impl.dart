
import '../../network/dio_client.dart';
import '../model/api_response.dart';
import '../remote/user_data_source.dart';
import 'user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final _dataSource = UserDataSource(DioClient.instance.dio);

  @override
  Future<ApiResponse> getUserInfo() async {
    try {
      final res = await _dataSource.getUserInfo();
      return res;
    } catch (err) {
      return ApiResponse.fromException(err);
    }
  }
}

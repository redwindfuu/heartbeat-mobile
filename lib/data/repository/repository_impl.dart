import 'package:heart_beat/data/model/get_heart_beat_response.dart';
import 'package:heart_beat/data/model/login_response.dart';

import '../../network/dio_client.dart';
import '../model/api_response.dart';
import '../remote/data_source.dart';
import 'repository.dart';

class RepositoryImpl extends Repository {
  static final instance = RepositoryImpl._();
  RepositoryImpl._();

  factory RepositoryImpl() {
    return instance;
  }

  final _dataSource = DataSource(DioClient.instance.dio);

  @override
  Future<ApiResponse> register(Map<String, dynamic> req) async {
    try {
      final res = await _dataSource.register(req);
      return res;
    } catch (err) {
      return ApiResponse.fromException(err);
    }
  }

  @override
  Future<ApiResponse<LoginResponse>> login(Map<String, dynamic> req) async {
    try {
      final res = await _dataSource.login(req);
      return res;
    } catch (err) {
      return ApiResponse.fromException(err);
    }
  }

  @override
  Future<ApiResponse<GetHeartBeatResponse>> getHeartBeat(Map<String, dynamic> req) async {
    try {
      final res = await _dataSource.getHeartBeat(req);
      return res;
    } catch (err) {
      return ApiResponse.fromException(err);
    }
  }
}

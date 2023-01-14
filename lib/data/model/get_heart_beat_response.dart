import 'package:json_annotation/json_annotation.dart';

part 'get_heart_beat_response.g.dart';

@JsonSerializable()
class GetHeartBeatResponse {
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'avg_beat')
  final double? avgBeat;
  @JsonKey(name: 'length')
  final int? length;
  @JsonKey(name: 'healthInfo')
  final Map<String, dynamic>? healthInfo;
  @JsonKey(name: 'listHeartBeat')
  final List<HeartBeat>? listHeartBeat;

  GetHeartBeatResponse({
    this.userId,
    this.name,
    this.avgBeat,
    this.length,
    this.healthInfo,
    this.listHeartBeat,
  });

  factory GetHeartBeatResponse.fromJson(Map<String, dynamic> json) => _$GetHeartBeatResponseFromJson(json);
}

@JsonSerializable()
class HeartBeat {
  @JsonKey(name: '_id')
  final String? id;
  @JsonKey(name: 'beat')
  final int? beat;

  HeartBeat({
    this.id,
    this.beat,
  });

  factory HeartBeat.fromJson(Map<String, dynamic> json) => _$HeartBeatFromJson(json);
}

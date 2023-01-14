import 'package:json_annotation/json_annotation.dart';

part 'post_heart_beat_response.g.dart';

@JsonSerializable()
class PostHeartBeatResponse {
  @JsonKey(name: 'userId')
  final String? userId;
  @JsonKey(name: 'name')
  final String? name;

  PostHeartBeatResponse({
    this.userId,
    this.name,
  });

  factory PostHeartBeatResponse.fromJson(Map<String, dynamic> json) => _$PostHeartBeatResponseFromJson(json);
}

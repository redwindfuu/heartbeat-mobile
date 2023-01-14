// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_heart_beat_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetHeartBeatResponse _$GetHeartBeatResponseFromJson(
        Map<String, dynamic> json) =>
    GetHeartBeatResponse(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      avgBeat: (json['avg_beat'] as num?)?.toDouble(),
      length: json['length'] as int?,
      healthInfo: json['healthInfo'] as Map<String, dynamic>?,
      listHeartBeat: (json['listHeartBeat'] as List<dynamic>?)
          ?.map((e) => HeartBeat.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetHeartBeatResponseToJson(
        GetHeartBeatResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'avg_beat': instance.avgBeat,
      'length': instance.length,
      'healthInfo': instance.healthInfo,
      'listHeartBeat': instance.listHeartBeat,
    };

HeartBeat _$HeartBeatFromJson(Map<String, dynamic> json) => HeartBeat(
      id: json['_id'] as String?,
      beat: json['beat'] as int?,
    );

Map<String, dynamic> _$HeartBeatToJson(HeartBeat instance) => <String, dynamic>{
      '_id': instance.id,
      'beat': instance.beat,
    };

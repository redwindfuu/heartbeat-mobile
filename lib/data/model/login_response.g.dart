// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      id: json['_id'] as String?,
      username: json['username'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      birth: json['birth'] as String?,
      isPlaySport: json['isPlaySport'] as bool?,
      gender: json['gender'] as bool?,
      whereLive: json['whereLive'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'username': instance.username,
      'password': instance.password,
      'name': instance.name,
      'birth': instance.birth,
      'isPlaySport': instance.isPlaySport,
      'gender': instance.gender,
      'whereLive': instance.whereLive,
    };

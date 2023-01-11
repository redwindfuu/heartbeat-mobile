import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse{

  @JsonKey(name: '_id')
  final String? id;
  final String? username;
  final String? password;
  final String? name;
  final String? birth;
  final bool? isPlaySport;
  final bool? gender;
  final String? whereLive;

  LoginResponse({this.id, this.username, this.password, this.name, this.birth,
      this.isPlaySport, this.gender, this.whereLive});

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}
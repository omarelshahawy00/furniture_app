import 'package:json_annotation/json_annotation.dart';

part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel {
  final String? status;
  final String? message;
  final UserModel? user;
  final String? token;

  LoginResModel({this.status, this.message, this.user, this.token});

  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResModelFromJson(json);
}

@JsonSerializable()
class UserModel {
  final int? id;
  final String? name;

  UserModel({this.id, this.name});

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

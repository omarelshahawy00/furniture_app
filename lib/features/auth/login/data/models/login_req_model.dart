
import 'package:json_annotation/json_annotation.dart';

part 'login_req_model.g.dart';
@JsonSerializable()
class LoginReqModel {
  final String name;
  final String password;

  LoginReqModel({required this.name, required this.password});


  Map<String, dynamic> toJson() => _$LoginReqModelToJson(this);
}
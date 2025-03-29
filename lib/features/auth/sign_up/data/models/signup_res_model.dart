
import 'package:json_annotation/json_annotation.dart';

part 'signup_res_model.g.dart';
@JsonSerializable()
class SignupResModel {
  final String? message;
  final String? status;

  SignupResModel({this.message, this.status});

  factory SignupResModel.fromJson(Map<String, dynamic> json) =>
      _$SignupResModelFromJson(json);
}
import 'package:json_annotation/json_annotation.dart';

part 'login_res_model.g.dart';

@JsonSerializable()
class LoginResModel {
  final String uid;
  final String email;
  final String? name;
  final String? phone;
  final String? address;

  LoginResModel({
    required this.uid,
    required this.email,
    this.name,
    this.phone,
    this.address,
  });

  factory LoginResModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResModelToJson(this);
}

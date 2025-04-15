import 'package:json_annotation/json_annotation.dart';
part 'signup_req_model.g.dart';

@JsonSerializable()
class SignupReqModel {
  final String? uid;
  final String? email;
  final String? password;
  final String? name;
  final String? phone;
  final String? address;

  SignupReqModel({
    this.uid,
    this.email,
    this.password,
    this.name,
    this.phone,
    this.address,
  });

  Map<String, dynamic> toJson() => _$SignupReqModelToJson(this);
}

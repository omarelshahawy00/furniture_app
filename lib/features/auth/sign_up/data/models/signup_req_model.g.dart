// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupReqModel _$SignupReqModelFromJson(Map<String, dynamic> json) =>
    SignupReqModel(
      email: json['email'] as String?,
      password: json['password'] as String?,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$SignupReqModelToJson(SignupReqModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };

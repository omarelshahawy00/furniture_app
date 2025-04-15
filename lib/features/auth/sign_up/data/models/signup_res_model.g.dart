// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupResModel _$SignupResModelFromJson(Map<String, dynamic> json) =>
    SignupResModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String?,
      phone: json['phone'] as String?,
      address: json['address'] as String?,
    );

Map<String, dynamic> _$SignupResModelToJson(SignupResModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'name': instance.name,
      'phone': instance.phone,
      'address': instance.address,
    };

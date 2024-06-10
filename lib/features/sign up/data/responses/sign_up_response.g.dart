// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpResponse _$SignUpResponseFromJson(Map<String, dynamic> json) =>
    SignUpResponse(
      firstName: json['U_FirstName'] as String?,
      middleName: json['U_MiddleName'] as String?,
      lastName: json['U_LastName'] as String?,
      type: json['U_Type'] as String?,
      email: json['U_Email'] as String?,
      password: json['U_Password'] as String?,
      age: (json['U_Age'] as num?)?.toInt(),
      id: json['_id'] as String?,
    );

Map<String, dynamic> _$SignUpResponseToJson(SignUpResponse instance) =>
    <String, dynamic>{
      'U_FirstName': instance.firstName,
      'U_MiddleName': instance.middleName,
      'U_LastName': instance.lastName,
      'U_Type': instance.type,
      'U_Email': instance.email,
      'U_Password': instance.password,
      'U_Age': instance.age,
      '_id': instance.id,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequest _$SignUpRequestFromJson(Map<String, dynamic> json) =>
    SignUpRequest(
      age: (json['U_Age'] as num?)?.toInt(),
      email: json['U_Email'] as String?,
      firstName: json['U_FirstName'] as String?,
      id: json['_id'] as String?,
      lastName: json['U_LastName'] as String?,
      password: json['U_Password'] as String?,
      middleName: json['U_MiddleName'] as String?,
      type: json['U_Type'] as String?,
    );

Map<String, dynamic> _$SignUpRequestToJson(SignUpRequest instance) =>
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

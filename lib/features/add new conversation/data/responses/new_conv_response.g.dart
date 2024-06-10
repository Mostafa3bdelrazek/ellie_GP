// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_conv_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewConvResponse _$NewConvResponseFromJson(Map<String, dynamic> json) =>
    NewConvResponse(
      cTime: json['C_Time'] as String?,
      cTitle: json['C_Title'] as String?,
      fID: json['F_ID'] as String?,
      uID: json['U_ID'] as String?,
      cID: json['_id'] as String?,
      v: (json['__v'] as num?)?.toInt(),
    );

Map<String, dynamic> _$NewConvResponseToJson(NewConvResponse instance) =>
    <String, dynamic>{
      'C_Time': instance.cTime,
      'C_Title': instance.cTitle,
      'U_ID': instance.uID,
      'F_ID': instance.fID,
      '_id': instance.cID,
      '__v': instance.v,
    };

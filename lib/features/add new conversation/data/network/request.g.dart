// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewConvRequest _$NewConvRequestFromJson(Map<String, dynamic> json) =>
    NewConvRequest(
      cTime: json['C_Time'] as String?,
      cTitle: json['C_Title'] as String?,
      uID: json['U_ID'] as String?,
    )..fID = json['F_ID'] as String?;

Map<String, dynamic> _$NewConvRequestToJson(NewConvRequest instance) =>
    <String, dynamic>{
      'C_Time': instance.cTime,
      'C_Title': instance.cTitle,
      'U_ID': instance.uID,
      'F_ID': instance.fID,
    };

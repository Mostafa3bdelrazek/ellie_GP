// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMessageRequest _$NewMessageRequestFromJson(Map<String, dynamic> json) =>
    NewMessageRequest(
      mTime: json['M_Time'] as String?,
      isUserMessage: json['M_UserMessage'] as bool?,
      mText: json['M_Text'] as String?,
      cID: json['C_ID'] as String?,
    );

Map<String, dynamic> _$NewMessageRequestToJson(NewMessageRequest instance) =>
    <String, dynamic>{
      'M_Time': instance.mTime,
      'M_UserMessage': instance.isUserMessage,
      'M_Text': instance.mText,
      'C_ID': instance.cID,
    };

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_message_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewMessageResponse _$NewMessageResponseFromJson(Map<String, dynamic> json) =>
    NewMessageResponse(
      mTime: json['M_Time'] as String?,
      isUserMessage: json['M_UserMessage'] as bool?,
      mText: json['M_Text'] as String?,
      mAction: (json['M_Action'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$NewMessageResponseToJson(NewMessageResponse instance) =>
    <String, dynamic>{
      'M_Time': instance.mTime,
      'M_UserMessage': instance.isUserMessage,
      'M_Text': instance.mText,
      'M_Action': instance.mAction,
    };

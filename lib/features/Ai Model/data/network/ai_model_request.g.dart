// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModelRequest _$AiModelRequestFromJson(Map<String, dynamic> json) =>
    AiModelRequest(
      image: AiModelRequest._fileFromJson(json['image'] as String?),
    );

Map<String, dynamic> _$AiModelRequestToJson(AiModelRequest instance) =>
    <String, dynamic>{
      'image': AiModelRequest._fileToJson(instance.image),
    };

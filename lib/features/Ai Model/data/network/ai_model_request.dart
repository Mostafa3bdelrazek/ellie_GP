// ignore_for_file: non_constant_identifier_names
import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'dart:io';
part 'ai_model_request.g.dart';
@JsonSerializable()
class AiModelRequest {
  @JsonKey(name: 'image', fromJson: _fileFromJson, toJson: _fileToJson)
  File? image;

  AiModelRequest({
    this.image,
  });

  factory AiModelRequest.fromJson(Map<String, dynamic> json) => _$AiModelRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AiModelRequestToJson(this);

  Map<String, dynamic> toFormData() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (image != null) {
      data['image'] = MultipartFile.fromFileSync(image!.path, filename: image!.path.split('/').last);
    }
    return data;
  }

  static File? _fileFromJson(String? path) {
    return path == null ? null : File(path);
  }

  static String? _fileToJson(File? file) {
    return file?.path;
  }
}

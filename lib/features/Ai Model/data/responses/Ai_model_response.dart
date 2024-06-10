// ignore_for_file: non_constant_identifier_names, file_names
import 'package:json_annotation/json_annotation.dart';
part 'Ai_model_response.g.dart';

@JsonSerializable()
class AiModelResponse {
  @JsonKey(name: 'state')
  String? state;

  AiModelResponse({
    this.state,
  });
  factory AiModelResponse.fromJson(Map<String, dynamic> json) =>
      _$AiModelResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AiModelResponseToJson(this);
}

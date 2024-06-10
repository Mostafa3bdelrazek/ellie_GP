// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'log_in_response.g.dart';

@JsonSerializable()
class LogInResponse {
  @JsonKey(name: 'loginState')
  String? loginState;

  LogInResponse({
    this.loginState,
  });
  factory LogInResponse.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LogInResponseToJson(this);
}

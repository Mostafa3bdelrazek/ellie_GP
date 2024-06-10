// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'request.g.dart';

@JsonSerializable()
class LogInRequest {
  @JsonKey(name: 'U_Email')
  String? email;
  @JsonKey(name: 'U_Password')
  String? password;

  LogInRequest({
    this.email,
    this.password,
  });
  factory LogInRequest.fromJson(Map<String, dynamic> json) =>
      _$LogInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LogInRequestToJson(this);
}

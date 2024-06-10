import 'package:json_annotation/json_annotation.dart';

part 'request.g.dart';

@JsonSerializable()
class SignUpRequest {
  @JsonKey(name: 'U_FirstName')
  String? firstName;

  @JsonKey(name: 'U_MiddleName')
  String? middleName;

  @JsonKey(name: 'U_LastName')
  String? lastName;

  @JsonKey(name: 'U_Type')
  String? type;

  @JsonKey(name: 'U_Email')
  String? email;

  @JsonKey(name: 'U_Password')
  String? password;

  @JsonKey(name: 'U_Age')
  int? age;

  @JsonKey(name: '_id')
  String? id;

  SignUpRequest({
    this.age,
    this.email,
    this.firstName,
    this.id,
    this.lastName,
    this.password,
    this.middleName,
    this.type
  });

  factory SignUpRequest.fromJson(Map<String, dynamic> json) => _$SignUpRequestFromJson(json);
  Map<String, dynamic> toJson() => _$SignUpRequestToJson(this);
}

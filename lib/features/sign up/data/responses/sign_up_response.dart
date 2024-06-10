// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignUpResponse {
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


  SignUpResponse({
    this.firstName,
    this.middleName,
    this.lastName,
    this.type,
    this.email,
    this.password,
    this.age,
    this.id,
  });
  factory SignUpResponse.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpResponseToJson(this);
}

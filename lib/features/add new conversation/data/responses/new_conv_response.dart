// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'new_conv_response.g.dart';
@JsonSerializable()
class NewConvResponse {
  @JsonKey(name: 'C_Time')
  String? cTime;
  @JsonKey(name: 'C_Title')
  String? cTitle;
  @JsonKey(name: 'U_ID')
  String? uID;
  @JsonKey(name: 'F_ID')
  // ignore: avoid_init_to_null
  String? fID = null;
  @JsonKey(name: '_id')
  String? cID;
  @JsonKey(name: '__v')
  int? v;

  NewConvResponse({
    this.cTime,
    this.cTitle,
    this.fID,
    this.uID,
    this.cID,
    this.v,
  });
  factory NewConvResponse.fromJson(Map<String, dynamic> json) =>
      _$NewConvResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewConvResponseToJson(this);
}

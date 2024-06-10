// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'request.g.dart';

@JsonSerializable()
class NewConvRequest {
  @JsonKey(name: 'C_Time')
  String? cTime;
  @JsonKey(name: 'C_Title')
  String? cTitle;
  @JsonKey(name: 'U_ID')
  String? uID;
  @JsonKey(name: 'F_ID')
  // ignore: avoid_init_to_null
  String? fID = null;
  NewConvRequest({
    this.cTime,
    this.cTitle,
    this.uID,
  });
  factory NewConvRequest.fromJson(Map<String, dynamic> json) =>
      _$NewConvRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewConvRequestToJson(this);
}

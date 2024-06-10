// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
part 'new_message_request.g.dart';

@JsonSerializable()
class NewMessageRequest {
  @JsonKey(name: 'M_Time')
  String? mTime;
  @JsonKey(name: 'M_UserMessage')
  bool? isUserMessage;
  @JsonKey(name: 'M_Text')
  String? mText;
  @JsonKey(name: 'C_ID')
  String? cID;
  NewMessageRequest({
    this.mTime,
    this.isUserMessage,
    this.mText,
    this.cID,
  });
  factory NewMessageRequest.fromJson(Map<String, dynamic> json) =>
      _$NewMessageRequestFromJson(json);

  Map<String, dynamic> toJson() => _$NewMessageRequestToJson(this);
}

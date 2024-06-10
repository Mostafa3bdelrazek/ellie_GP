// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';

part 'new_message_response.g.dart';
@JsonSerializable()
class NewMessageResponse {
  @JsonKey(name: 'M_Time')
  String? mTime;
  @JsonKey(name: 'M_UserMessage')
  bool? isUserMessage;
  @JsonKey(name: 'M_Text')
  String? mText;
  @JsonKey(name: 'M_Action')
  List<String>? mAction;
   NewMessageResponse({
    this.mTime,
    this.isUserMessage,
    this.mText,
    this.mAction,
  });
  factory NewMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$NewMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewMessageResponseToJson(this);
}

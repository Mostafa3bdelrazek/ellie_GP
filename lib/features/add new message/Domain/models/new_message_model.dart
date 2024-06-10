class NewMessageModel {
  final String mTime;
  final bool isUserMessage;
  final String mText;
  final List<String> mAction;

  NewMessageModel({
    required this.mTime,
    required this.isUserMessage,
    required this.mText,
    required this.mAction,
  });
}

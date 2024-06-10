import 'package:chart/core/app/constants.dart';
import 'package:chart/core/app/extension.dart';
import 'package:chart/features/add%20new%20message/Domain/models/new_message_model.dart';

import '../responses/new_message_response.dart';

extension NewMessageMapper on NewMessageResponse? {
  NewMessageModel toDomain() {
    return NewMessageModel(
      mTime: this?.mTime.orEmpty() ?? Constants.empty,

      mText: this?.mText.orEmpty() ?? Constants.empty,

      mAction: this?.mAction??[],
      
      isUserMessage: true,
    );
  }
}

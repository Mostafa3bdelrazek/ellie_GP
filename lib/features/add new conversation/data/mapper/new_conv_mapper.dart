import 'package:chart/core/app/constants.dart';
import 'package:chart/core/app/extension.dart';

import '../../Domain/models/new_conv_model.dart';
import '../responses/new_conv_response.dart';

extension NewConvMapper on NewConvResponse? {
  NewConvModel toDomain() {
    return NewConvModel(
      cTime: this?.cTime.orEmpty() ?? Constants.empty,
      cTitle: this?.cTitle.orEmpty() ?? Constants.empty,
      cID: this?.cID.orEmpty()??Constants.empty,
      fID: this?.fID.orEmpty()??Constants.empty,
      uId: this?.uID.orEmpty()??Constants.empty,
      v: this?.v ?? Constants.zero,
    );
  }
}
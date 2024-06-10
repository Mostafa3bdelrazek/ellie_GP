import 'package:chart/core/app/constants.dart';
import 'package:chart/core/app/extension.dart';

import '../../Domain/models/log_in_model.dart';
import '../responses/log_in_response.dart';

extension LogInMapper on LogInResponse? {
  LogInModel toDomain() {
    return LogInModel(
        loginState: this?.loginState.orEmpty() ?? Constants.empty);
  }
}

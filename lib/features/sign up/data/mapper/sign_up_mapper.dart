import 'package:chart/core/app/constants.dart';
import 'package:chart/core/app/extension.dart';
import 'package:chart/features/sign%20up/data/responses/sign_up_response.dart';
import 'package:chart/features/sign%20up/Domain/models/sign_up_model.dart';

extension SignUpMapper on SignUpResponse? {
  SignUpModel toDomain() {
    return SignUpModel(
      middleName: this?.middleName.orEmpty() ?? Constants.empty,
      lastName: this?.lastName.orEmpty() ?? Constants.empty,
      type: this?.type.orEmpty() ?? Constants.empty,
      email: this?.email.orEmpty() ?? Constants.empty,
      password: this?.password.orEmpty() ?? Constants.empty,
      age: this?.age ?? Constants.zero,
      id: this?.id.orEmpty() ?? Constants.empty,
    );
  }
}

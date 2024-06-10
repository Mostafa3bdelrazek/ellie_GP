import 'package:chart/features/sign%20up/Domain/models/sign_up_model.dart';
import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/failure.dart';

abstract class SignUpRepo {
  Future<Either<Failure, SignUpModel>> userData(SignUpRequest signUpRequest);
}

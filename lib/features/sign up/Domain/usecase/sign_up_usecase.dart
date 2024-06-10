import 'package:chart/core/data/network/failure.dart';
import 'package:chart/core/domain/usecase/base_usecase.dart';
import 'package:chart/features/sign%20up/Domain/models/sign_up_model.dart';
import 'package:chart/features/sign%20up/Domain/repository/sign_up_repo.dart';
import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:dartz/dartz.dart';

class SignUpUsecase implements BaseUseCase<SignUpRequest, SignUpModel> {
  final SignUpRepo _signUpRepo;

  SignUpUsecase(this._signUpRepo);
  @override
  Future<Either<Failure, SignUpModel>> execute(
      SignUpRequest signUpRequest) async {
    return await _signUpRepo.userData(signUpRequest);
  }
}

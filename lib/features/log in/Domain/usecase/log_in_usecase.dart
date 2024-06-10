import 'package:chart/core/data/network/failure.dart';
import 'package:chart/core/domain/usecase/base_usecase.dart';
import 'package:chart/features/log%20in/Domain/repository/log_in_repo.dart';
import 'package:dartz/dartz.dart';

import '../../data/network/request.dart';
import '../models/log_in_model.dart';

class LogInUsecase implements BaseUseCase<LogInRequest, LogInModel> {
  final LogInRepo _logInRepo;

  LogInUsecase(this._logInRepo);
  @override
  Future<Either<Failure, LogInModel>> execute(
      LogInRequest logInRequest) async {
    return await _logInRepo.userData(logInRequest);
  }
}

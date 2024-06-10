import 'dart:developer';

import 'package:chart/features/log%20in/Domain/repository/log_in_repo.dart';
import 'package:chart/features/log%20in/data/mapper/log_in_mapper.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/failure.dart';
import '../../../../core/data/network/network_info.dart';
import '../../Domain/models/log_in_model.dart';
import '../data source/remote_data_source.dart';
import '../network/request.dart';

class LogInRepoImplement extends LogInRepo {
  final RemoteLogInDataSource _remoteLogInDataSource;
  final NetworkInfo _networkInfo;

  LogInRepoImplement(
    this._remoteLogInDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, LogInModel>> userData(
      LogInRequest logInRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteLogInDataSource.loginUser(logInRequest);
        log("success");
        return Right(response.toDomain());
      } catch (e) {
        log(e.toString());

        return left(Failure(ResponseCode.BAD_REQUEST, e.toString()));
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}

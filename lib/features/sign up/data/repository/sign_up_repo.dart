import 'dart:developer';

import 'package:chart/core/data/network/failure.dart';
import 'package:chart/features/sign%20up/Domain/models/sign_up_model.dart';
import 'package:chart/features/sign%20up/Domain/repository/sign_up_repo.dart';
import 'package:chart/features/sign%20up/data/data%20source/remote_data_source.dart';
import 'package:chart/features/sign%20up/data/mapper/sign_up_mapper.dart';
import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/network_info.dart';

class SignUpRepoImplement extends SignUpRepo {
  final RemoteSignUpDataSource _remoteSignUpDataSource;
  final NetworkInfo _networkInfo;

  SignUpRepoImplement(
    this._remoteSignUpDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, SignUpModel>> userData(
      SignUpRequest signUpRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response = await _remoteSignUpDataSource.addUser(signUpRequest);
        log("success$response");
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

import 'dart:developer';

import 'package:chart/core/data/network/failure.dart';
import 'package:chart/features/add%20new%20conversation/Domain/models/new_conv_model.dart';
import 'package:chart/features/add%20new%20conversation/data/mapper/new_conv_mapper.dart';
import 'package:chart/features/add%20new%20conversation/data/network/request.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/network_info.dart';
import '../../Domain/repository/new_conv_repo.dart';
import '../data source/remote_data_source.dart';

class NewConvRepoImplement extends NewConvRepo {
  final RemoteNewConvDataSource _remoteNewConvDataSource;
  final NetworkInfo _networkInfo;

  NewConvRepoImplement(
    this._remoteNewConvDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, NewConvModel>> userData(NewConvRequest newConvRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        log("success");
        final response = await _remoteNewConvDataSource.addConv(newConvRequest);
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

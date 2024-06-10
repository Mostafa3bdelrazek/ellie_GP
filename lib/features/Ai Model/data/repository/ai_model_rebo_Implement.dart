// ignore_for_file: file_names

import 'dart:developer';

import 'package:chart/features/Ai%20Model/data/data%20source/remote_data_source.dart';
import 'package:chart/features/Ai%20Model/data/mapper/ai_model_mapper.dart';
import 'package:chart/features/Ai%20Model/data/network/ai_model_request.dart';
import 'package:chart/features/Ai%20Model/domin/models/ai_model_model.dart';
import 'package:chart/features/Ai%20Model/domin/repository/ai_model_rebo.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/failure.dart';
import '../../../../core/data/network/network_info.dart';

class AiModelRepoImplement extends AiModelRepo {
  final RemoteAiModelDataSource _remoteAiModelDataSource;
  final NetworkInfo _networkInfo;

  AiModelRepoImplement(
    this._remoteAiModelDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, AiModel>> userData(
      AiModelRequest aiModelRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteAiModelDataSource.aiModel(AiModelRequest());
        log("Ai Model success");
        log(response as String);
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

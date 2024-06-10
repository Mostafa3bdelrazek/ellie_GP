import 'dart:developer';

import 'package:chart/core/data/network/failure.dart';
import 'package:chart/features/add%20new%20message/data/mapper/new_message_mapper.dart';
import 'package:chart/features/add%20new%20message/data/network/new_message_request.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/data/network/error_handler.dart';
import '../../../../core/data/network/network_info.dart';
import '../../Domain/models/new_message_model.dart';
import '../../Domain/repository/new_message_repo.dart';
import '../data source/remote_data_source.dart';

class NewMessageRepoImplement extends NewMessageRepo {
  final RemoteNewMessageDataSource _remoteNewMessageDataSource;
  final NetworkInfo _networkInfo;

  NewMessageRepoImplement(
    this._remoteNewMessageDataSource,
    this._networkInfo,
  );

  @override
  Future<Either<Failure, NewMessageModel>> newMessage(
      NewMessageRequest newMessageRequest) async {
    if (await _networkInfo.isConnect) {
      try {
        final response =
            await _remoteNewMessageDataSource.addMessage(newMessageRequest);
        
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

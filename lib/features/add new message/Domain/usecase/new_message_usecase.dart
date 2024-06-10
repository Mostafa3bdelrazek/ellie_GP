import 'package:chart/core/data/network/failure.dart';
import 'package:chart/core/domain/usecase/base_usecase.dart';
import 'package:chart/features/add%20new%20message/Domain/models/new_message_model.dart';
import 'package:chart/features/add%20new%20message/data/network/new_message_request.dart';
import 'package:dartz/dartz.dart';

import '../repository/new_message_repo.dart';

class AddNewMessageUsecase
    implements BaseUseCase<NewMessageRequest, NewMessageModel> {
  final NewMessageRepo _newMessageRepo;

  AddNewMessageUsecase(this._newMessageRepo);
  @override
  Future<Either<Failure, NewMessageModel>> execute(
      NewMessageRequest newMessageRequest) async {
    return await _newMessageRepo.newMessage(newMessageRequest);
  }
}

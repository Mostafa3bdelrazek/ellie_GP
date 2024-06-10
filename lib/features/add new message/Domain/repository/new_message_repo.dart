
import 'package:chart/features/add%20new%20message/data/network/new_message_request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/failure.dart';
import '../models/new_message_model.dart';

abstract class NewMessageRepo {
  Future<Either<Failure, NewMessageModel>> newMessage(NewMessageRequest newMessageRequest);
}

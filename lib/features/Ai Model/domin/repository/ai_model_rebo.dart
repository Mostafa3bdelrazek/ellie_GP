
import 'package:chart/features/Ai%20Model/data/network/ai_model_request.dart';
import 'package:chart/features/Ai%20Model/domin/models/ai_model_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/failure.dart';


abstract class AiModelRepo {
  Future<Either<Failure, AiModel>> userData(AiModelRequest aiModelRequest );
}

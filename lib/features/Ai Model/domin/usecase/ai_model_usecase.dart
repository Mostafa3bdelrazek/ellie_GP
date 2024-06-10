
import 'package:chart/core/data/network/failure.dart';
import 'package:chart/core/domain/usecase/base_usecase.dart';
import 'package:chart/features/Ai%20Model/data/network/ai_model_request.dart';
import 'package:chart/features/Ai%20Model/domin/models/ai_model_model.dart';
import 'package:chart/features/Ai%20Model/domin/repository/ai_model_rebo.dart';
import 'package:dartz/dartz.dart';

class AiModelUsecase implements BaseUseCase<AiModelRequest, AiModel> {
  final AiModelRepo _aiModelRepo;

  AiModelUsecase(this._aiModelRepo);
  @override
  Future<Either<Failure, AiModel>> execute(
      AiModelRequest aiModelRequest) async {
    return await _aiModelRepo.userData(aiModelRequest);
  }
}
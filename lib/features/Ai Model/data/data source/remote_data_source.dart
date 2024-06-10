

import 'package:chart/features/Ai%20Model/data/network/ai_model_request.dart';
import 'package:chart/features/Ai%20Model/data/network/ai_model_service.dart';
import 'package:chart/features/Ai%20Model/data/responses/Ai_model_response.dart';

abstract class RemoteAiModelDataSource {
  Future<AiModelResponse> aiModel(AiModelRequest aiModelRequest);
}

class RemoteAiModelDataSourceImpl extends RemoteAiModelDataSource {
  final AiModelServiceClient _aiModelServiceClient;
  RemoteAiModelDataSourceImpl(this._aiModelServiceClient);
  
  @override
  Future<AiModelResponse> aiModel(AiModelRequest aiModelRequest) {
    return _aiModelServiceClient.machine(AiModelRequest());
  }
}

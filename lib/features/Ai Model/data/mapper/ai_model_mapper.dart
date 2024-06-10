import 'package:chart/core/app/constants.dart';
import 'package:chart/core/app/extension.dart';
import 'package:chart/features/Ai%20Model/domin/models/ai_model_model.dart';

import '../responses/Ai_model_response.dart';

extension AiModelMapper on AiModelResponse? {
  AiModel toDomain() {
    return AiModel(
        state: this?.state.orEmpty() ?? Constants.empty, );
  }
}

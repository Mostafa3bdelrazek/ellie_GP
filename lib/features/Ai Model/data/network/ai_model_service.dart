// ignore_for_file: file_names

import 'package:chart/features/Ai%20Model/data/network/ai_model_request.dart';
import 'package:chart/features/Ai%20Model/data/responses/Ai_model_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'ai_model_service.g.dart';

@RestApi(baseUrl: 'https://eye-tracker.onrender.com/')
abstract class AiModelServiceClient {
  factory AiModelServiceClient(Dio dio, {String baseUrl}) = _AiModelServiceClient;
  @POST('eyeTracker/')
  Future<AiModelResponse> machine(@Body() AiModelRequest aiModelRequest);
}

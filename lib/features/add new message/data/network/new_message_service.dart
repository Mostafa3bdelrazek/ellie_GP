// ignore_for_file: file_names


import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/app/constants.dart';
import '../responses/new_message_response.dart';
import 'new_message_request.dart';

part 'new_message_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class NewMessageServiceClient {
  factory NewMessageServiceClient(Dio dio, {String baseUrl}) = _NewMessageServiceClient;
  @POST('/message')
  Future<NewMessageResponse> addMessage(@Body() NewMessageRequest newMessageRequest);
}

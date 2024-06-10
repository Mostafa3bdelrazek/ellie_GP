// ignore_for_file: file_names

import 'package:chart/features/log%20in/data/network/request.dart';
import 'package:chart/features/log%20in/data/responses/log_in_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/app/constants.dart';
part 'LogInService.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class LogInServiceClient {
  factory LogInServiceClient(Dio dio, {String baseUrl}) = _LogInServiceClient;
  @POST('/login')
  Future<LogInResponse> addUser(@Body() LogInRequest logInRequest);
}

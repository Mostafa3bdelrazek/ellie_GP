// ignore_for_file: file_names

import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:chart/features/sign%20up/data/responses/sign_up_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import '../../../../core/app/constants.dart';
part 'signUpService.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class SignUpServiceClient {
  factory SignUpServiceClient(Dio dio, {String baseUrl}) = _SignUpServiceClient;
  @POST('/user')
  Future<SignUpResponse> addUser(@Body() SignUpRequest signUpRequest);
}

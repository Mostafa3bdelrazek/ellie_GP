// ignore_for_file: file_names


import 'package:chart/features/add%20new%20conversation/data/network/request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/app/constants.dart';
import '../responses/new_conv_response.dart';

part 'new_conv_service.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class NewConvServiceClient {
  factory NewConvServiceClient(Dio dio, {String baseUrl}) = _NewConvServiceClient;
  @POST('/conversation')
  Future<NewConvResponse> addConv(@Body() NewConvRequest newConvRequest);
}

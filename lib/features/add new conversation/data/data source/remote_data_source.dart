import 'package:chart/features/add%20new%20conversation/data/network/new_conv_service.dart';
import '../network/request.dart';
import '../responses/new_conv_response.dart';

abstract class RemoteNewConvDataSource {
  Future<NewConvResponse> addConv(NewConvRequest ncRequest);
}

class RemoteNewConvDataSourceImpl extends RemoteNewConvDataSource {
  final NewConvServiceClient _newConvServiceClient;
  RemoteNewConvDataSourceImpl(this._newConvServiceClient);

  @override
  Future<NewConvResponse> addConv(NewConvRequest ncRequest) {
    return _newConvServiceClient.addConv(ncRequest);
  }
}

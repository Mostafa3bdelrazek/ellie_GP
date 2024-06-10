import 'package:chart/features/add%20new%20message/data/network/new_message_request.dart';

import '../network/new_message_service.dart';
import '../responses/new_message_response.dart';

abstract class RemoteNewMessageDataSource {
  Future<NewMessageResponse> addMessage(NewMessageRequest newMessageRequest);
}

class RemoteNewMessageDataSourceImpl extends RemoteNewMessageDataSource {
  final NewMessageServiceClient _newMessageServiceClient;
  RemoteNewMessageDataSourceImpl(this._newMessageServiceClient);

  @override
  Future<NewMessageResponse> addMessage(NewMessageRequest newMessageRequest) {
    return _newMessageServiceClient.addMessage(newMessageRequest);
  }
}

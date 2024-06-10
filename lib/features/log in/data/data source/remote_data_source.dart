
import '../network/LogInService.dart';
import '../network/request.dart';
import '../responses/log_in_response.dart';

abstract class RemoteLogInDataSource {
  Future<LogInResponse> loginUser(LogInRequest logInRequest);
}

class RemoteLogInDataSourceImpl extends RemoteLogInDataSource {
  final LogInServiceClient _logInServiceClient;
  RemoteLogInDataSourceImpl(this._logInServiceClient);
  
  @override
  Future<LogInResponse> loginUser(LogInRequest logInRequest) {
    return _logInServiceClient.addUser(logInRequest);
  }
}

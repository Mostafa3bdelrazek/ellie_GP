import '../network/request.dart';
import '../network/signUpService.dart';
import '../responses/sign_up_response.dart';

abstract class RemoteSignUpDataSource {
  Future<SignUpResponse> addUser(SignUpRequest signUpRequest);
}

class RemoteSignUpDataSourceImpl extends RemoteSignUpDataSource {
  final SignUpServiceClient _signUpServiceClient;
  RemoteSignUpDataSourceImpl(this._signUpServiceClient);
  
  @override
  Future<SignUpResponse> addUser(SignUpRequest signUpRequest) {
    return _signUpServiceClient.addUser(signUpRequest);
  }

  
}

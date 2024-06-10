import 'package:chart/core/data/network/failure.dart';
import 'package:chart/core/domain/usecase/base_usecase.dart';
import 'package:chart/features/add%20new%20conversation/Domain/models/new_conv_model.dart';
import 'package:chart/features/add%20new%20conversation/data/network/request.dart';
import 'package:dartz/dartz.dart';

import '../repository/new_conv_repo.dart';

class NewConvUsecase implements BaseUseCase<NewConvRequest, NewConvModel> {
  final NewConvRepo _newConvRepo;

  NewConvUsecase(this._newConvRepo);
  @override
  Future<Either<Failure, NewConvModel>> execute(NewConvRequest newConvRequest) async {
    return await _newConvRepo.userData(newConvRequest);
  }
}

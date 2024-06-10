import 'package:chart/features/add%20new%20conversation/Domain/models/new_conv_model.dart';
import 'package:chart/features/add%20new%20conversation/data/network/request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/failure.dart';

abstract class NewConvRepo {
  Future<Either<Failure, NewConvModel>> userData(NewConvRequest newConvRequest);
}

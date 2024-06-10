
import 'package:chart/features/log%20in/data/network/request.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/data/network/failure.dart';
import '../models/log_in_model.dart';

abstract class LogInRepo {
  Future<Either<Failure, LogInModel>> userData(LogInRequest logInRequest );
}

import 'package:chart/features/log%20in/Domain/usecase/log_in_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/models/log_in_model.dart';
import '../../../data/network/request.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit(this._logInUsecase) : super(LogInInitial());
  final LogInUsecase _logInUsecase ;
  logInUser(LogInRequest logInRequest) async {
    emit(LogInCubitLoading());
    (await _logInUsecase.execute(logInRequest)).fold((l) {
      emit(LogInCubitFailure(l.message));
    }, (r) {
      emit(LogInCubitSuccess(r));
    });
  }
}

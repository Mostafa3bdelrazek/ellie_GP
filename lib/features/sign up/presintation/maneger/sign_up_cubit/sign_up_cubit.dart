import 'package:chart/features/sign%20up/Domain/models/sign_up_model.dart';
import 'package:chart/features/sign%20up/Domain/usecase/sign_up_usecase.dart';
import 'package:chart/features/sign%20up/data/network/request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpCubitState> {
  SignUpCubit.signUpCubit(this._signUpUsecase) : super(SignUpCubitInitial());
  final SignUpUsecase _signUpUsecase;
  createUser(SignUpRequest signUpRequest) async {
    emit(SignUpCubitLoading());
    (await _signUpUsecase.execute(signUpRequest)).fold((l) {
      emit(SignUpCubitFailure(l.message));
    }, (r) {
      emit(SignUpCubitSuccess(r));
    });
  }
}

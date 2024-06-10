import 'package:chart/features/add%20new%20conversation/Domain/models/new_conv_model.dart';
import 'package:chart/features/add%20new%20conversation/Domain/usecase/new_conv_usecase.dart';
import 'package:chart/features/add%20new%20conversation/data/network/request.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'add_new_conversation_state.dart';

class AddNewConversationCubit extends Cubit<AddNewConversationState> {
  AddNewConversationCubit(this._newConvUsecase) : super(AddNewConversationInitial());
  final NewConvUsecase _newConvUsecase;
  addNewConversation(NewConvRequest newConvRequest) async {
    emit(AddNewConversationLoading());
     (await _newConvUsecase.execute(newConvRequest)).fold((l) {
      emit(AddNewConversationFailure(l.message));
    }, (r) {
      emit(AddNewConversationSuccess(r));
    });
  }
}


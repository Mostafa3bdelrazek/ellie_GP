// ignore_for_file: unnecessary_null_comparison

import 'dart:developer';

import 'package:chart/features/add%20new%20message/Domain/models/new_message_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Domain/usecase/new_message_usecase.dart';
import '../../../data/network/new_message_request.dart';

import 'package:flutter_tts/flutter_tts.dart';
part 'add_new_message_state.dart';

class AddNewMessageCubit extends Cubit<AddNewMessageState> {
  AddNewMessageCubit(this._newMessageUsecase) : super(AddNewMessageInitial());
  static AddNewMessageCubit get(context) => BlocProvider.of(context);
  final AddNewMessageUsecase _newMessageUsecase;
  addNewMessage(NewMessageRequest newMessageRequest, FlutterTts tts) async {
    emit(AddNewMessageLoading());
    (await _newMessageUsecase.execute(newMessageRequest)).fold((l) {
      log(l.message.toString());
      emit(AddNewMessageFailure(l.message));
    }, (r) {
      log(r.toString());
      if (r.mText != null) {
        log(r.mText);
        String? text = r.mText;
        tts.speak(text);
      } else {
        tts.speak('some thing want wrong');
        log(r.mText);
      }
      emit(AddNewMessageSuccess(r));
    });
  }
}

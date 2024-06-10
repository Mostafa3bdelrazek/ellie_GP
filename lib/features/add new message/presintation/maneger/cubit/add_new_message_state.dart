part of 'add_new_message_cubit.dart';

class AddNewMessageState {}

class AddNewMessageInitial extends AddNewMessageState {}

class AddNewMessageLoading extends AddNewMessageState {}

class AddNewMessageSuccess extends AddNewMessageState {
  final NewMessageModel newMessageModel;

  AddNewMessageSuccess(this.newMessageModel);
}

class AddNewMessageFailure extends AddNewMessageState {
  final String errorMessage;

  AddNewMessageFailure(this.errorMessage);

}

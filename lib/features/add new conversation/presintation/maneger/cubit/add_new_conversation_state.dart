part of 'add_new_conversation_cubit.dart';

class AddNewConversationState {}

class AddNewConversationInitial extends AddNewConversationState {}

class AddNewConversationSuccess extends AddNewConversationState {
  final NewConvModel newConvModel;

  AddNewConversationSuccess(this.newConvModel);
}

class AddNewConversationLoading extends AddNewConversationState {}

class AddNewConversationFailure extends AddNewConversationState {
  final String errorMessage;

  AddNewConversationFailure(this.errorMessage);
}
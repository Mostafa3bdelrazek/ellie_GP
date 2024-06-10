part of 'ai_model_cubit.dart';
class AiModelState {}

class AiModelInitial extends AiModelState {}

class AiModelSuccess extends AiModelState {
  final AiModel aiModel;
  AiModelSuccess(this.aiModel);
}

class AiModelLoading extends AiModelState {}

class AiModelFailure extends AiModelState {
  final String errorMessage;

  AiModelFailure(this.errorMessage);
}
part of 'log_in_cubit.dart';

class LogInState {}

class LogInInitial extends LogInState {}

class LogInCubitSuccess extends LogInState {
  final LogInModel logInModel;
  LogInCubitSuccess(this.logInModel);
}

class LogInCubitLoading extends LogInState {}

class LogInCubitFailure extends LogInState {
  final String errorMessage;
  LogInCubitFailure(this.errorMessage);
}

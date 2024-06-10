part of 'sign_up_cubit.dart';

class SignUpCubitState {}

class SignUpCubitInitial extends SignUpCubitState {}

class SignUpCubitSuccess extends SignUpCubitState {
  final SignUpModel signUpModel;
  SignUpCubitSuccess(this.signUpModel);
}

class SignUpCubitLoading extends SignUpCubitState {}

class SignUpCubitFailure extends SignUpCubitState {
  final String errorMessage;
  SignUpCubitFailure(this.errorMessage);
}

part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponse response;

  SignUpSuccess(this.response);
}

class SignUpFailure extends SignUpState {
  String errorMessage;

  SignUpFailure(this.errorMessage);
}

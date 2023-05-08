part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpState {}

class SignUpInitial extends SignUpState {}

class SignUpLoading extends SignUpState {}

class SignUpSuccess extends SignUpState {
  final SignUpResponse response;

  SignUpSuccess({required this.response});
}

class SignUpFailure extends SignUpState {
  final String message;

  SignUpFailure({required this.message});
}

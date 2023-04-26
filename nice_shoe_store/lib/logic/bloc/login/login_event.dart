part of 'login_bloc.dart';

abstract class LoginEvent {}

class OnLogin extends LoginEvent {
  final String email;
  final String password;

  OnLogin({required this.email, required this.password});
}
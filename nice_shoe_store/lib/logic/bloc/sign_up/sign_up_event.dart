part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class OnSignUp extends SignUpEvent {
  final String email;
  final String password;

  OnSignUp({
    required this.email,
    required this.password,
  });
}

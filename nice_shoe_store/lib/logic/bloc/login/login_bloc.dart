import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLogin>(_onLogin);
  }

  FutureOr<void> _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    // TODO: use api to check login information
    await Future.delayed(const Duration(seconds: 3));
    emit(LoginSuccess());
  }
}

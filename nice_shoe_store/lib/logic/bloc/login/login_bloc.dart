import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shoe_store/data/model/Login_response.dart';
import 'package:nike_shoe_store/data/model/login_request.dart';
import 'package:nike_shoe_store/data/provider/user_provider.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<OnLogin>(_onLogin);
  }

  final provider = UserProvider();

  FutureOr<void> _onLogin(OnLogin event, Emitter<LoginState> emit) async {
    emit(LoginLoading());
    try {
      final response = await provider.login(
        LoginRequest(username: event.email, password: event.password),
      );
      emit(LoginSuccess(response));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}

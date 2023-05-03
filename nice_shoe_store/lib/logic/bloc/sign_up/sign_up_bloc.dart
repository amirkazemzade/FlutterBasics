import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nike_shoe_store/data/model/sign_up_response.dart';
import 'package:nike_shoe_store/data/provider/user_provider.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUp>(_onSignUp);
  }

  final provider = UserProvider();

  FutureOr<void> _onSignUp(OnSignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final response = await provider.signUp(event.email, event.password);
      emit(SignUpSuccess(response));
    } catch (e) {
      emit(SignUpFailure(e.toString()));
    }
  }
}

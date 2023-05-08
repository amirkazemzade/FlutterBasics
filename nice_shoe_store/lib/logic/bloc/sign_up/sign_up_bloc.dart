import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shoe_store/constants.dart';
import 'package:nike_shoe_store/data/model/error_response.dart';
import 'package:nike_shoe_store/data/model/sign_up_response.dart';
import 'package:nike_shoe_store/data/providers/auth_provider.dart';

part 'sign_up_event.dart';

part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<OnSignUp>(_mapOnSignUpToState);
  }

  final provider = AuthProvider();

  void _mapOnSignUpToState(OnSignUp event, Emitter<SignUpState> emit) async {
    emit(SignUpLoading());
    try {
      final response = await provider.signUp(event.email, event.password);
      emit(SignUpSuccess(response: response));
    } on ErrorResponse catch (e) {
      emit(SignUpFailure(message: e.message ?? defaultError));
    } catch (e, trace) {
      log(e.toString());
      log(trace.toString());
      emit(SignUpFailure(message: defaultError));
    }
  }
}

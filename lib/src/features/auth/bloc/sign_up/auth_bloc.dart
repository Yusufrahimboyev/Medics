import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/utils/status_enum.dart';

part 'auth_state.dart';

part 'auth_event.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthEvent>(
      (event, emit) => switch (event) {
        SignUp$AuthEvent _ => _signUp(event, emit),
      },
    );
  }

  Future<void> _signUp(SignUp$AuthEvent event, Emitter<AuthState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await event.context.dependencies.authRepository.signUp(
        username: event.name,
        email: event.email,
        password: event.password,
      );
      if(result["success"] as bool && event.context.mounted){
        event.context.go(AppRouter.signUpVerify, extra: event.email);
      }else{
        emit(state.copyWith(status: Status.error, isError: true));
      }
    } on Object catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: Status.error, isError: true));
    }
  }
}

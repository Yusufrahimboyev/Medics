import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import 'package:medics/src/features/auth/screen/login_screen.dart';

import '../../../../common/constants/constants.dart';
import '../../../../common/router/app_router.dart';
import '../../../../common/utils/status_enum.dart';

part 'password_verify_state.dart';

part 'password_verify_event.dart';

class PasswordVerifyBloc extends Bloc<PasswordVerifyEvent, PasswordVerifyState> {
  PasswordVerifyBloc() : super(const PasswordVerifyState()) {
    on<PasswordVerifyEvent>(
      (event, emit) => switch (event) {
        PasswordVerify$PasswordVerifyEvent _ => _passwordVerify(event, emit),
      },
    );
  }

  Future<void> _passwordVerify(
      PasswordVerify$PasswordVerifyEvent event, Emitter<PasswordVerifyState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result =
          await event.context.dependencies.authRepository.passwordVerify(
        email: event.email,
        code: event.code,
      );
      if(result["success"] as bool && event.context.mounted){
        await event.context.dependencies.sharedPreferences.setString(Constants.token5, result["data"] as String);
        event.context.go(AppRouter.newPassword, extra: event.email);
      } else {
        emit(state.copyWith(status: Status.error));
      }
    } on Object catch (e) {
      if (kDebugMode) {
        print(e);
      }
      emit(state.copyWith(status: Status.error, isError: true));
    }
  }
}

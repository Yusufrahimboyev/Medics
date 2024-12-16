import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../../common/router/app_router.dart';
import '../../../../common/utils/status_enum.dart';

import '../../widgets/login_dialog.dart';

part 'sign_up_verify_state.dart';

part 'sign_up_verify_event.dart';

class SignUpVerifyBloc extends Bloc<SignUpVerifyEvent, SignUpVerifyState> {
  SignUpVerifyBloc() : super(const SignUpVerifyState()) {
    on<SignUpVerifyEvent>(
      (event, emit) => switch (event) {
        Verify$SignUpVerifyEvent _ => _verify(event, emit),
        Resend$SignUpVerify _ => _resent(event, emit),
      },
    );
  }

  Future<void> _verify(
      Verify$SignUpVerifyEvent event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result =
          await event.context.dependencies.authRepository.signUpVerify(
        email: event.email,
        code: event.code,
      );
      if ((result["success"] as bool?) != null &&
          result["success"] as bool &&
          event.context.mounted) {
        showDialog(
          context: event.context,
          builder: (context) => SuccessWidget(
            title: context.lang.Success,
            message: context.lang.successfully_registered,
            buttonText: context.lang.Login,
            onPressed: () => event.context.go(AppRouter.logIn),
          ),
        );
        emit(state.copyWith(status: Status.success));
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

  Future<void> _resent(
      Resend$SignUpVerify event, Emitter<SignUpVerifyState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result = await event.context.dependencies.authRepository.resetEmail(
        email: event.email,
      );
      if ((result["success"] as bool?) != null &&
          result["success"] as bool &&
          event.context.mounted) {
        showDialog(
          context: event.context,
          builder: (context) => SuccessWidget(
            title: context.lang.Success,
            message: context.lang.successfully_registered,
            buttonText: context.lang.Login,
            onPressed: () => event.context.go(AppRouter.logIn),
          ),
        );
        emit(state.copyWith(status: Status.success));
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

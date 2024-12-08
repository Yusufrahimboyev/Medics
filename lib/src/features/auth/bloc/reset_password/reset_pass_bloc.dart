import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/utils/context_extension.dart';
import '../../../../common/constants/constants.dart';
import '../../../../common/router/app_router.dart';
import '../../../../common/utils/status_enum.dart';
import '../../screen/login_screen.dart';
part 'reset_pass_event.dart';
part 'reset_pass_state.dart';

class ResetPassBloc extends Bloc<ResetPassEvent, ResetPassState> {
  ResetPassBloc() : super( const ResetPassState()) {
    on<ResetPassEvent>(
          (event, emit) => switch (event) {
            ResetPass$ResetPassEvent _ => _resetPass(event, emit),
      },
    );
  }

  Future<void> _resetPass(
      ResetPass$ResetPassEvent event, Emitter<ResetPassState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result =
      await event.context.dependencies.authRepository.resetEmail(
        email: event.email,
      );
      if(result["success"] as bool && event.context.mounted){
        await event.context.dependencies.sharedPreferences
            .setString(Constants.userEmail, event.email);
        event.context.go(AppRouter.verify, extra: event.email);
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

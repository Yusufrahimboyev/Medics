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
part 'log_in_state.dart';
part 'log_in_event.dart';

class LogInBloc extends Bloc<LogInEvent, LogInState> {
  LogInBloc() : super( const LogInState()) {
    on<LogInEvent>(
      (event, emit) => switch (event) {
        LogIn$LogInEvent _ => _logIn(event, emit),
      },
    );
  }

  Future<void> _logIn(
      LogIn$LogInEvent event, Emitter<LogInState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result =
          await event.context.dependencies.authRepository.logIn(
        email: event.email,
        password: event.password,
      );
      if ((result["success"] as bool?) != null &&
          result["success"] as bool &&
          event.context.mounted) {
        await event.context.dependencies.sharedPreferences.setString(Constants.token, result["data"] as String);
        await event.context.dependencies.sharedPreferences
            .setString(Constants.userEmail, event.email);
        print(event.context.dependencies.sharedPreferences.getString(Constants.token));
        if(event.context.mounted){
          showDialog(
            context: event.context,
            builder: (context) => SuccessWidget(
              title: context.lang.Welcome_Back,
              message: context.lang.Once_again,
              buttonText: context.lang.go_home,
              onPressed: () => event.context.go(AppRouter.home),
            ),
          );
        }
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

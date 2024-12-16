import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medics/src/common/constants/constants.dart';
import 'package:medics/src/common/utils/context_extension.dart';


import '../../../../common/router/app_router.dart';
import '../../../../common/utils/status_enum.dart';

import '../../widgets/login_dialog.dart';

part 'new_password_state.dart';

part 'new_password_event.dart';

class NewPasswordBloc extends Bloc<NewPasswordEvent, NewPasswordState> {
  NewPasswordBloc() : super(const NewPasswordState()) {
    on<NewPasswordEvent>(
      (event, emit) => switch (event) {
        NewPassword$NewPasswordEvent _ => _newPassword(event, emit),
      },
    );
  }

  Future<void> _newPassword(NewPassword$NewPasswordEvent event,
      Emitter<NewPasswordState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final result =
          await event.context.dependencies.authRepository.newPassword(
        email: event.context.dependencies.shp.getString(Constants.userEmail) ?? "",
        password: event.password,
        token: event.context.dependencies.shp.getString(Constants.token5 ) ?? "",
      );
      if ((result["success"] as bool?) != null &&
          result["success"] as bool &&
          event.context.mounted) {
        showDialog(
          context: event.context,
          builder: (context) => SuccessWidget(
            title: context.lang.Success,
            message: context.lang.You_successfully_reset,
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

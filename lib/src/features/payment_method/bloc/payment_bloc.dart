import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:medics/src/common/utils/context_extension.dart';

import '../../../common/constants/constants.dart';
import '../../../common/utils/status_enum.dart';
part 'payment_event.dart';
part 'payment_state.dart';


class PaymentBloc extends Bloc<PaymentEvent, PaymentState> {
  PaymentBloc() : super(const PaymentState()) {
    on<PaymentEvent>((event, emit) => switch (event) {
      ShowBalance$MyWalletEvent() => _showbalance(event, emit),
    });
  }

  void _showbalance(
      ShowBalance$MyWalletEvent event, Emitter<PaymentState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final int balance =
        event.context.dependencies.shp.getInt(Constants.balance) ?? 0;
    emit(
      state.copyWith(status: Status.success, wBalance: balance),
    );
  }
}

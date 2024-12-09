import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../common/utils/status_enum.dart';



part 'second_top_up_event.dart';

part 'second_top_up_state.dart';

class SecondTopUpBloc extends Bloc<SecondTopUpEvent, SecondTopUpState> {
  SecondTopUpBloc() : super(const SecondTopUpState()) {
    on<SecondTopUpEvent>((event, emit) => switch (event) {
          ChangeRadioList$SecondTopUpEvent _ => _changeradiolist(event, emit),
        });
  }

  void _changeradiolist(ChangeRadioList$SecondTopUpEvent event,
      Emitter<SecondTopUpState> emit) async {
    emit(state.copyWith(status: Status.loading));
    emit(state.copyWith(
        status: Status.success, isSelect: event.v ?? state.isSelect));
  }
}

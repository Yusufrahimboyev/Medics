import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../common/utils/status_enum.dart';

part 'doctor_detail_event.dart';

part 'doctor_detail_state.dart';

class DoctorDetailBloc extends Bloc<DoctorDetailEvent, DoctorDetailState> {
  DoctorDetailBloc() : super(const DoctorDetailState()) {
    on<ChangeDate$DoctorDetailEvent>(_changeDatelist);
    on<ChangeTime$DoctorDetailEvent>(_changeTimelist);
  }

  void _changeDatelist(ChangeDate$DoctorDetailEvent event,
      Emitter<DoctorDetailState> emit) async {
    emit(state.copyWith(status: Status.loading));
    emit(state.copyWith(
        status: Status.success, isSelect: event.indexDate ?? state.isSelect));
  }

  void _changeTimelist(ChangeTime$DoctorDetailEvent event,
      Emitter<DoctorDetailState> emit) async {
    emit(state.copyWith(status: Status.loading));
    emit(state.copyWith(
        status: Status.success, isSelect: event.indexDate ?? state.isSelect));
  }
}

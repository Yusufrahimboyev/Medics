import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:medics/src/common/model/medics_model.dart';
import 'package:medics/src/common/utils/status_enum.dart';
import '../../../features/home/main/data/main_repository.dart';
part 'main_event.dart';
part 'main_state.dart';
class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc({
    required final IMainRepository mainRepository,
  })  : _mainRepository = mainRepository,
        super(const MainState()) {
    on<MainEvent>((event, emit) => switch (event) {
          GetDoctors$MainEvent() => _getDoctors(event, emit),
          GetArticles$MainEvent() => _getArticles(event, emit),
        });
  }

  final IMainRepository _mainRepository;

  Future<void> _getDoctors(
      GetDoctors$MainEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final doctors = await _mainRepository.getDoctor(context: event.context);
    emit(state.copyWith(status: Status.success, doctors: doctors));
  }

  Future<void> _getArticles(
      GetArticles$MainEvent event, Emitter<MainState> emit) async {
    emit(state.copyWith(status: Status.loading));
    final articles = await _mainRepository.getArticles(context: event.context);
    emit(state.copyWith(status: Status.success, articles: articles));
  }
}

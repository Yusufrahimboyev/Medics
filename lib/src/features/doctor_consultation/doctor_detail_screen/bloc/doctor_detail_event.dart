part of 'doctor_detail_bloc.dart';

sealed class DoctorDetailEvent {
  const DoctorDetailEvent();
}

final class ChangeDate$DoctorDetailEvent extends DoctorDetailEvent {
  final int? indexDate;

  const ChangeDate$DoctorDetailEvent({required this.indexDate});
}

final class ChangeTime$DoctorDetailEvent extends DoctorDetailEvent {
  final int? indexDate;

  const ChangeTime$DoctorDetailEvent({required this.indexDate});
}

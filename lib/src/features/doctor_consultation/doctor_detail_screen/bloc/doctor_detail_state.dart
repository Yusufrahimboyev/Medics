part of 'doctor_detail_bloc.dart';

class DoctorDetailState extends Equatable {
  final Status status;
  final int isSelect;

  const DoctorDetailState({this.status = Status.intial, this.isSelect = 0});

  @override
  List<Object> get props => [status, isSelect];

  DoctorDetailState copyWith({final Status? status, final int? isSelect}) =>
      DoctorDetailState(
          status: status ?? this.status, isSelect: isSelect ?? this.isSelect);
}

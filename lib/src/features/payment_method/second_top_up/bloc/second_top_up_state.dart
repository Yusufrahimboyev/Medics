part of 'second_top_up_bloc.dart';

class SecondTopUpState extends Equatable {
  final Status status;
  final int isSelect;

  const SecondTopUpState({this.status = Status.intial, this.isSelect = 0});

  @override
  List<Object?> get props => [status, isSelect];

  SecondTopUpState copyWith({final Status? status, final int? isSelect}) =>
      SecondTopUpState(
        status: status ?? this.status,
        isSelect: isSelect ?? this.isSelect,
      );
}

part of 'reset_pass_bloc.dart';

class ResetPassState extends Equatable {
  final Status status;
  final bool isError;

  const ResetPassState({
    this.status = Status.intial,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
    status,
    isError,
  ];

  ResetPassState copyWith({
    Status? status,
    bool? isError,
  }) =>
      ResetPassState(
        status: status ?? this.status,
        isError: isError ?? this.isError,
      );
}

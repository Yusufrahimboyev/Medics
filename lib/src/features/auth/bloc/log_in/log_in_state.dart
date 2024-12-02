part of 'log_in_bloc.dart';

class LogInState extends Equatable {
  final Status status;
  final bool isError;

  const LogInState({
    this.status = Status.intial,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
        status,
        isError,
      ];

  LogInState copyWith({
    Status? status,
    bool? isError,
  }) =>
      LogInState(
        status: status ?? this.status,
        isError: isError ?? this.isError,
      );
}

part of 'password_verify_bloc.dart';

class PasswordVerifyState extends Equatable {
  final Status status;
  final bool isError;

  const PasswordVerifyState({
    this.status = Status.intial,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
        status,
        isError,
      ];

  PasswordVerifyState copyWith({
    Status? status,
    bool? isError,
  }) =>
      PasswordVerifyState(
        status: status ?? this.status,
        isError: isError ?? this.isError,
      );
}

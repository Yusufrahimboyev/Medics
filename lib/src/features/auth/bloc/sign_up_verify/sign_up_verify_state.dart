part of 'sign_up_verify_bloc.dart';

class SignUpVerifyState extends Equatable {
  final Status status;
  final bool isError;

  const SignUpVerifyState({
    this.status = Status.intial,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
        status,
        isError,
      ];

  SignUpVerifyState copyWith({
    Status? status,
    bool? isError,
  }) =>
      SignUpVerifyState(
        status: status ?? this.status,
        isError: isError ?? this.isError,
      );
}

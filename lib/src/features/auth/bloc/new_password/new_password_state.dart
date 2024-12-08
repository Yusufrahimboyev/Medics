part of 'new_password_bloc.dart';

class NewPasswordState extends Equatable {
  final Status status;
  final bool isError;

  const NewPasswordState({
    this.status = Status.intial,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
        status,
        isError,
      ];

  NewPasswordState copyWith({
    Status? status,
    bool? isError,
  }) =>
      NewPasswordState(
        status: status ?? this.status,
        isError: isError ?? this.isError,
      );
}

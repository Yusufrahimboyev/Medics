part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final Status status;
  final bool isLoggedIn;
  final bool isShown;
  final bool checkBox;
  final bool isError;

  const AuthState({
    this.status = Status.intial,
    this.isLoggedIn = false,
    this.isShown = false,
    this.checkBox = false,
    this.isError = false,
  });

  @override
  List<Object?> get props => [
        status,
        isLoggedIn,
        isShown,
        checkBox,
        isError,
      ];

  AuthState copyWith({
    Status? status,
    bool? isLoggedIn,
    bool? isShown,
    bool? checkBox,
    bool? isError,
  }) =>
      AuthState(
        status: status ?? this.status,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isShown: isShown ?? this.isShown,
        checkBox: checkBox ?? this.checkBox,
        isError: isError ?? this.isError,
      );
}

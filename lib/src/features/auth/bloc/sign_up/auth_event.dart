part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

final class SignUp$AuthEvent extends AuthEvent {
  final String name;
  final String email;
  final String password;
  final BuildContext context;

  const SignUp$AuthEvent({
    required this.name,
    required this.email,
    required this.password,
    required this.context,
  });
}

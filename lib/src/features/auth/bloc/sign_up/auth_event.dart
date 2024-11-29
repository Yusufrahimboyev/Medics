part of 'auth_bloc.dart';

sealed class AuthEvent {
  const AuthEvent();
}

// final class SignIn$AuthEvent extends AuthEvent {
//   final String email;
//   final String password;
//   final BuildContext context;
//
//   const SignIn$AuthEvent({
//     required this.email,
//     required this.password,
//     required this.context,
//   });
// }

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

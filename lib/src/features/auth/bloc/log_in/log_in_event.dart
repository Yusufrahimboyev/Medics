part of 'log_in_bloc.dart';

sealed class LogInEvent {
  const LogInEvent();
}

final class LogIn$LogInEvent extends LogInEvent {
  final String email;
  final String password;
  final BuildContext context;

  LogIn$LogInEvent({
    required this.email,
    required this.context,
    required this.password,
  });
}

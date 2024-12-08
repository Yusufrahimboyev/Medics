part of 'new_password_bloc.dart';

sealed class NewPasswordEvent {
  const NewPasswordEvent();
}

final class NewPassword$NewPasswordEvent extends NewPasswordEvent {
  final String password;
  final BuildContext context;

  const NewPassword$NewPasswordEvent({
    required this.password,
    required this.context,
  });
}

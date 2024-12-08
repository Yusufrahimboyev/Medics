part of 'password_verify_bloc.dart';

sealed class PasswordVerifyEvent {
  const PasswordVerifyEvent();
}

final class PasswordVerify$PasswordVerifyEvent extends PasswordVerifyEvent {
  final String email;
  final String code;
  final BuildContext context;

  const PasswordVerify$PasswordVerifyEvent({
    required this.email,
    required this.context,
    required this.code,
  });
}

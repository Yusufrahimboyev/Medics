part of 'sign_up_verify_bloc.dart';

sealed class SignUpVerifyEvent {
  const SignUpVerifyEvent();
}

final class Verify$SignUpVerifyEvent extends SignUpVerifyEvent {
  final String email;
  final String code;
  final BuildContext context;

  const Verify$SignUpVerifyEvent({
    required this.email,
    required this.context,
    required this.code,
  });
}
final class Resend$SignUpVerify extends SignUpVerifyEvent {
  final String email;
  final BuildContext context;

  const Resend$SignUpVerify({
    required this.email,
    required this.context,
  }
  );
}


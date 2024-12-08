part of 'reset_pass_bloc.dart';


sealed class ResetPassEvent {
  const ResetPassEvent();
}

final class ResetPass$ResetPassEvent extends ResetPassEvent {
  final String email;
  final BuildContext context;

  ResetPass$ResetPassEvent({
    required this.email,
    required this.context,
  });
}

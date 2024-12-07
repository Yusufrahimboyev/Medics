part of 'second_top_up_bloc.dart';

sealed class SecondTopUpEvent {
  const SecondTopUpEvent();
}

final class ChangeRadioList$SecondTopUpEvent extends SecondTopUpEvent {
  final int? v;

  ChangeRadioList$SecondTopUpEvent({required this.v});
}

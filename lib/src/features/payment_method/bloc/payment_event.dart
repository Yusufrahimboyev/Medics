part of 'payment_bloc.dart';

sealed class PaymentEvent {
  const PaymentEvent();
}

final class ShowBalance$MyWalletEvent extends PaymentEvent {
  final BuildContext context;

  const ShowBalance$MyWalletEvent({required this.context});
}

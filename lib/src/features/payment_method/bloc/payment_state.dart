part of 'payment_bloc.dart';

class PaymentState extends Equatable {
  final Status status;
  final int wBalance;

  const PaymentState({
    this.status = Status.intial,
    this.wBalance = 0,
  });

  @override
  List<Object?> get props => [
    status,
    wBalance,
  ];

  PaymentState copyWith({
    Status? status,
    int? wBalance,
  }) =>
      PaymentState(
        status: status ?? this.status,
        wBalance: wBalance ?? this.wBalance,
      );
}

import 'package:edhp/features/payment_orders/model/PaymentOrderDetails.dart';
import 'package:edhp/features/payment_orders/model/PaymentsOrderResponse.dart';

abstract class PaymentOrdersState{}

class InitialPaymentOrdersState extends PaymentOrdersState{

}

class PaymentOrdersLoadedSuccessfullyState extends PaymentOrdersState{
  final PaymentsOrderResponse requests;

  PaymentOrdersLoadedSuccessfullyState({required this.requests});
}

class PaymentOrderCanceledSuccessfullyState extends PaymentOrdersState{

  PaymentOrderCanceledSuccessfullyState();
}

class PaymentOrderDetailsLoadedSuccessfully extends PaymentOrdersState{
  final List<PaymentOrderDetails> details;

  PaymentOrderDetailsLoadedSuccessfully({required this.details});
}

class PaymentOrdersFailState extends PaymentOrdersState{
  final String error;

  PaymentOrdersFailState({required this.error});
}
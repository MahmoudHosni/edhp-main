import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/payment_orders/cubit/PaymentOrdersCubit.dart';
import 'package:edhp/features/payment_orders/cubit/PaymentOrdersState.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:edhp/features/payment_orders/widgets/PaymentOrderItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOrdersPage extends StatefulWidget{

  @override
  State<PaymentOrdersPage> createState() => _PaymentOrdersPageState();
}

class _PaymentOrdersPageState extends State<PaymentOrdersPage> {
  late PaymentOrdersCubit _paymentOrdersCubit;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PaymentOrdersCubit()..getOrders(),
        child: BlocBuilder<PaymentOrdersCubit, PaymentOrdersState>(
            builder: (context, state) {
              _paymentOrdersCubit = PaymentOrdersCubit.get(context);
              return ViewContainer(title: StringsManager.ordersPayments, showBack: true,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                    (state is PaymentOrdersLoadedSuccessfullyState) ? Expanded(child: ListView(
                        padding: EdgeInsets.zero, shrinkWrap: false, children: [
                      for(PaymentSubscriptionOrder request in (state.requests?.spSubscriptionPayments??[]))
                        drawRequest(request),
                    ])) :(state is PaymentOrderCanceledSuccessfullyState)? getWaitingView():

                    const CircularProgressIndicator(),
                  ],)
              );
            }));
  }

  drawRequest(PaymentSubscriptionOrder request) {
    return PaymentOrderItem(request: request,requestCancelOrder: requestCancelOrder);
  }

  requestCancelOrder(PaymentSubscriptionOrder request){
    _paymentOrdersCubit.cancelOrderRequest(request.iD ??0).then(
            (value) =>
                _paymentOrdersCubit.getOrders());
  }

  getWaitingView() {
    _paymentOrdersCubit.getOrders();
    return CircularProgressIndicator();
  }
}
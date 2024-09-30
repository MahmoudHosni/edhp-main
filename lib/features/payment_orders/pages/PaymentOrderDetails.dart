import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmDialog.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/payment_orders/cubit/PaymentOrdersCubit.dart';
import 'package:edhp/features/payment_orders/cubit/PaymentOrdersState.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:edhp/features/payment_orders/pages/DetailsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class PaymentOrderDetails extends StatefulWidget{
  final PaymentSubscriptionOrder order;

  PaymentOrderDetails({required this.order});

  @override
  State<PaymentOrderDetails> createState() => _PaymentOrderDetailsState();
}

class _PaymentOrderDetailsState extends State<PaymentOrderDetails> {
  late PaymentOrdersCubit cubit;

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) => PaymentOrdersCubit()..getOrderServices(widget.order.iD ??0),
        child: BlocBuilder<PaymentOrdersCubit, PaymentOrdersState>(
            builder: (context, state) {
              cubit = PaymentOrdersCubit.get(context);
              return ViewContainer(title: StringsManager.ordersPayments, showBack: true,
                  body: Column(mainAxisAlignment: MainAxisAlignment.start,children: [
                    (state is PaymentOrderDetailsLoadedSuccessfully) ?
                        DetailsView(order: widget.order,details: state.details,callBcak:showConfirmDialog) : const CircularProgressIndicator(),
                  ],)
              );
            }));
  }

  requestCancelOrder(){
    cubit.cancelOrderRequest(widget.order.iD ??0).then((value) => goBack());
  }

  void showConfirmDialog(BuildContext context) async{
    if(await confirm(context,title: const Text("تاكيد الالغاء",style: Styles.textStyle14W500,),content: const Text(StringsManager.ConfirmDelete,style: Styles.textStyle14W500,),
      textOK:const Text(StringsManager.Ok,style: Styles.textStyle13W500,),
      textCancel:  const Text(StringsManager.Cancel,style: Styles.textStyle13W500,),
    )){
      requestCancelOrder();
    } else {};
  }

  goBack() {
    while(GoRouter.of(context).canPop()){
      GoRouter.of(context).pop();
    }
  }
}
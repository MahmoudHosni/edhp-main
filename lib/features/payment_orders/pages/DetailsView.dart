import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/payment_orders/model/PaymentOrderDetails.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DetailsView extends StatefulWidget{
  final PaymentSubscriptionOrder order;
  final List<PaymentOrderDetails> details;
  final Function callBcak;

  DetailsView({required this.order,required this.details,required this.callBcak});

  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the right for Arabic text
          children: [
            Text(widget.order.creationServiceProviderBranchName ??"", style: Styles.textStyle11W500.copyWith(color: AppColors.blackColor),),
            const SizedBox(height: 16.0),
            // Text(widget.order. ??'', style: Styles.textStyle14W500.copyWith(color: AppColors.blackColor),),
            // const SizedBox(height: 4.0),
            Table(
              border: TableBorder.all(color: Colors.indigo),
              columnWidths: const {
                0: FlexColumnWidth(2),
                1: FlexColumnWidth(1),
              },
              children: [
                TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text('اسم الخدمة', textAlign: TextAlign.center, style: Styles.textStyle12W500.copyWith(color: AppColors.blackColor),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Text('المبلغ', textAlign: TextAlign.center, style: Styles.textStyle12W500.copyWith(color: AppColors.blackColor),),
                  ),
                ]),
                for(PaymentOrderDetails s in (widget.details))
                    TableRow(children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(s.serviceName ??"", textAlign: TextAlign.center, style: Styles.textStyle12W500.copyWith(color: AppColors.primaryBlueColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text((s.actualPrice ??0).toString(), textAlign: TextAlign.center, style: Styles.textStyle12W500.copyWith(color: AppColors.textColorBlue)),
                      ),
                    ]),
              ],
            ),
            const SizedBox(height: 16.0),
            Text(
              'إجمالي المبلغ: ${widget.details[0]?.actualPrice ??0}',
              textAlign: TextAlign.right,
              style: Styles.textStyle12W500.copyWith(color: AppColors.redColor)
            ),
            const SizedBox(height: 26.0),
            Visibility(visible: (widget.order.approvalStatus ??2)==2 && ((widget.order.isPaid??true)==false),child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                    child: DefaultButton(
                      backgroundColor: AppColors.blue,
                      function: () {
                        GoRouter.of(context).push(AppRouters.kPaymentCashVisaScreen,extra: widget.order);
                      },
                      text: "متابعة الدفع",fontSize: 12,
                      redius: 32,width: 130,height: 42,
                    )),
                Padding(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                    child: DefaultButton(
                      backgroundColor: AppColors.lightGray,
                      function: () {
                        widget.callBcak(context);
                      },
                      text: "الغاء",fontSize: 12,
                      redius: 32,width: 130,textColor: AppColors.blackColor,height: 42,
                    ))
              ],
            ),),
          ],
        ),
    );
  }
}
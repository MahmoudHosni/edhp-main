import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ConfirmDialog.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/app_routers.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PaymentOrderItem extends StatelessWidget{
  final PaymentSubscriptionOrder request;
  final Function requestCancelOrder;

  PaymentOrderItem({required this.request,required this.requestCancelOrder});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0), margin: const EdgeInsets.all(6),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.cardBorderNew),
          color:  AppColors.cardBorderNew,
          boxShadow: const [
            BoxShadow(
              color: AppColors.cardBorderNew,
              blurRadius: 1,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align to the right for Arabic text
        children: [
          Text(
            'اسم فرع مقدم الخدمة :',
            textAlign: TextAlign.right,
            style: Styles.textStyle11W500.copyWith(color: AppColors.textColorBlue),
          ),
          Padding(padding: EdgeInsets.all(4),child: Text(
            request.creationServiceProviderBranchName ??"",
            textAlign: TextAlign.right,
            style: Styles.textStyle11W500.copyWith(color: AppColors.blackColor),
          ),), //
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text(
              'إجمالي مبلغ الخدمات',
              textAlign: TextAlign.right,
              style: Styles.textStyle11W500.copyWith(color: AppColors.textColorBlue),
            ),

            Text((request.paymentOrder?.payAmount??0).toString(),style: Styles.textStyle16W500.copyWith(color: AppColors.blackColor),)
          ],),

          Center(
            child: GestureDetector(
              onTap: () {
                // GoRouter.of(context).push(AppRouters.kPaymentCashVisaScreen,extra: request);
                GoRouter.of(context).push(AppRouters.kPaymentOrderDetails,extra: request);
              },
              child: Text(
                'تفصيل الخدمات',
                textAlign: TextAlign.center,
                style: Styles.textStyle16W500.copyWith(color: AppColors.textColorBlue,decoration: TextDecoration.underline),
              ),
            ),
          ),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
            Text(
              'حالة الطلب' ,
              textAlign: TextAlign.right,
              style: Styles.textStyle11W500.copyWith(color: AppColors.textColorBlue),
            ),

            Text(
              request.approvalStatusName ??"",
              textAlign: TextAlign.right,
              style: Styles.textStyle14W500.copyWith(color: AppColors.blackColor),
            ),
          ],),
          const SizedBox(height: 4.0),

          !(request.isPaid?? false)? Row(mainAxisAlignment:MainAxisAlignment.spaceBetween,crossAxisAlignment: CrossAxisAlignment.center,children: [
            ((request.approvalStatus ??2)==2 && ((request.isPaid??true)==false))? Padding(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                child: DefaultButton(
                  backgroundColor: AppColors.blue,
                  function: () {
                    GoRouter.of(context).push(AppRouters.kPaymentCashVisaScreen,extra: request);
                  },
                  text: "متابعة الدفع",fontSize: 12,
                  redius: 32,width: 130,height: 42,
                )):const SizedBox(width: 130,),
                Visibility(visible: (request.approvalStatus ??3)!=3,child:// (request.approvalStatus ??2)==2 && ((request.isPaid??true)==false
                    Padding(
                      padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
                        child: DefaultButton(
                          backgroundColor: AppColors.lightGray,
                          function: () {
                            showConfirmDialog(context);
                          },
                          text: "الغاء",fontSize: 12,
                          redius: 32,width: 130,textColor: AppColors.blackColor,height: 42,
                        )),),

          ],)  : const SizedBox(),
        ],
      ),
    );
  }

  void showConfirmDialog(BuildContext context) async{
    if(await confirm(context,title: const Text("تاكيد الالغاء",style: Styles.textStyle14W500,),content: const Text(StringsManager.ConfirmDelete,style: Styles.textStyle14W500,),
                    textOK:const Text(StringsManager.Ok,style: Styles.textStyle13W500,),
                     textCancel:  const Text(StringsManager.Cancel,style: Styles.textStyle13W500,),
    )){
      requestCancelOrder(request);
    } else {};
  }

}
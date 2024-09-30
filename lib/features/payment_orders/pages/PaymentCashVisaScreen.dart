import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/core/utils/app_components/widgets/default_button.dart';
import 'package:edhp/core/utils/styles/styles.dart';
import 'package:edhp/features/payment/cubit/PaymentCubit.dart';
import 'package:edhp/features/payment_orders/model/PaymentSubscriptionOrder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

class PaymentCashVisaScreen extends StatefulWidget{
  final PaymentSubscriptionOrder request;

  PaymentCashVisaScreen({required this.request});

  @override
  State<PaymentCashVisaScreen> createState() => _PaymentCashVisaScreenState();
}

class _PaymentCashVisaScreenState extends State<PaymentCashVisaScreen> {
  String _paymentMethod = 'bank';
  int price=0;
  String _createOrderResult='';
  PayParams? payParams;
  CashierStatusParam? cashierStatusParam;

  @override
  void initState() {
    super.initState();
    //create order params
    price = widget.request.paymentOrder?.payAmount ??0;
    payParams = PayParams(
      publicKey: "OPAYPUB17054873586430.9721343449466545",
      merchantId: "281824011794632",
      merchantName: "Edhp",
      reference: widget.request.paymentOrder?.referenceCode ??'',
      countryCode: Country.egypt.countryCode,
      payAmount: (widget.request.paymentOrder?.payAmount ?? 0)*100,
      currency: Country.egypt.currency,
      productName: widget.request.paymentOrder?.productName ??"",
      productDescription: widget.request.paymentOrder?.productDescription ??"",
      callbackUrl: "http://www.edhp.com",
      paymentType:"BankCard",
      expireAt:30,
      userClientIP:"102.1.1.1",
      //userInfo: UserInfo("1","11@bb.com","10101010","name"),
    );

    cashierStatusParam = CashierStatusParam(
        privateKey:"OPAYPRV*************1157474",
        merchantId: "281821120675251",
        reference:"126",
        orderNo:"",
        countryCode:Country.egypt.countryCode
    );
  }

 // Default payment method
  @override
  Widget build(BuildContext context) {
    return ViewContainer(title: "دفع الطلب", body: Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align text to the right
        children: [
          Text(
            widget.request.creationServiceProviderBranchName ??"",
            textAlign: TextAlign.right,
            style: Styles.textStyle11W500,
          ),
          const SizedBox(height: 16.0),
          Text(
            'إجمالي مبلغ الخدمات: ${(price).toString()}',
            textAlign: TextAlign.right,
            style: Styles.textStyle14W500.copyWith(color: Colors.blue),
          ),
          const SizedBox(height: 24.0),
          Text(
            'اختيار طريقة الدفع',
            textAlign: TextAlign.right,
            style: Styles.textStyle11W500.copyWith(color: Colors.brown),
          ),
          const SizedBox(height: 8.0),
          RadioListTile<String>(
              title: Text('كروت بنكية', textAlign: TextAlign.right,style: Styles.textStyle12W500.copyWith(color: Colors.indigo),),
              value: 'bank',
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                  price = widget.request.paymentOrder?.payAmount ??0;
                });
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset('assets/icons/visa.svg', width: 60, height: 34),
              SvgPicture.asset('assets/icons/mastercard.svg', width: 60, height: 34),
              Image.asset('assets/images/meeza-logo.png', width: 60, height: 34),
            ],
          ),
          RadioListTile<String>(
              title: Text('نقدى', textAlign: TextAlign.right,style: Styles.textStyle12W500.copyWith(color: Colors.indigo),),
              value: 'cash',
              groupValue: _paymentMethod,
              onChanged: (value) {
                setState(() {
                  _paymentMethod = value!;
                  price = (widget.request.paymentOrder?.payAmount ??0)+50;
                });
              },
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8.0,right: 40),
                child: SvgPicture.asset('assets/icons/money_icon.svg', width: 60, height: 34),
              ),
            ],
          ),

          const SizedBox(height: 16.0),
          Padding(
              padding: const EdgeInsetsDirectional.symmetric(horizontal: 6),
              child: DefaultButton(
                backgroundColor: AppColors.blue,
                function: () {
                  payRequestOrder(widget.request);
                },
                text: "دفع",fontSize: 12,
                redius: 32,width: double.infinity,height: 42,
              )),

    ]),));
  }

  void payRequestOrder(PaymentSubscriptionOrder request) {
    if(_paymentMethod=="bank"){
      _createOrder();
    }else{
      goBack();
    }
  }

  void _createOrder() {
    EasyLoading.show(status: "loading");
    OPayTask().createOrder(context,payParams!!,httpFinishedMethod:(){
      EasyLoading.dismiss();
    }).then((response){
      // httpResponse （Just check the reason for the failure of the network request）
      setState(() {
        _createOrderResult=response.payHttpResponse.toJson((value){
          if(value!=null){
            return value.toJson();
          }
          return null;
        }).toString();
        if(_createOrderResult.contains("status: error") || _createOrderResult.contains("status: INITIAL")){
          cancelPayment(true);
          EasyLoading.showToast(StringsManager.ErrorOccured,duration: const Duration(seconds:5));
          goBack();
        }else {
          EasyLoading.showToast(
              _createOrderResult, duration: const Duration(seconds: 5));
          debugPrint("httpResult=$_createOrderResult");
        }
      });

      // h5 Response （Payment result check ）
      if(response.webJsResponse!=null){
        var status = response.webJsResponse?.orderStatus;
        debugPrint("webJsResponse.status=$status");
        if(status!=null){
          if(status.toLowerCase().contains("success")){
            cancelPayment(false);
            EasyLoading.showToast("تم الدفع بنجاح",duration: const Duration(seconds:5));
            goBack();
          }else {
            cancelPayment(true);
            EasyLoading.showToast(status, duration: const Duration(seconds: 5));
          }
        }
        switch(status){
          case PayResultStatus.initial:
            EasyLoading.showToast("العملية initial",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.pending:
            EasyLoading.showToast("العملية معلقة",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.success:
            EasyLoading.showToast("تم الدفع بنجاح",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.fail:
            cancelPayment(true);
            EasyLoading.showToast("لم تتم العملية حدث خطا",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.close:
            break;
        }
      }
    });
  }

  void cancelPayment(bool isCancelled) {
    PaymentCubit.get(context).
    cancelFailedMembership(widget.request.paymentOrder?.referenceCode ??'',
        (widget.request.paymentOrder?.payAmount ?? 0).toString(),
        isCancelled);
    goBack();
  }

  void goBack() {
    while(GoRouter.of(context).canPop()){
      GoRouter.of(context).pop();
    }
  }
}
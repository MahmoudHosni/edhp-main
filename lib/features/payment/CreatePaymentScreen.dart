import 'package:edhp/core/utils/StringsManager.dart';
import 'package:edhp/core/utils/app_components/widgets/ViewContainer.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:opay_online_flutter_sdk/opay_online_flutter_sdk.dart';

class CreatePaymentScreen extends StatefulWidget{
  final ConfirmResponse confirmResponse;

  CreatePaymentScreen({required this.confirmResponse});

  @override
  State<CreatePaymentScreen> createState() => _CreatePaymentScreenState();
}

class _CreatePaymentScreenState extends State<CreatePaymentScreen> {
  String _createOrderResult='';
  String _getCashierStatusResult='';
  PayParams? payParams;
  CashierStatusParam? cashierStatusParam;

  @override
  void initState() {
    super.initState();

    //create order params
    payParams = PayParams(
      publicKey: "OPAYPUB17054873586430.9721343449466545",
      merchantId: "281824011794632",
      merchantName: "Edhp",
      reference: widget.confirmResponse.result?.paymentDetails?.referenceCode ??'',
      countryCode: Country.egypt.countryCode,
      payAmount: (widget.confirmResponse.result?.TotalPrice ?? 0)*100,
      currency: Country.egypt.currency,
      productName: widget.confirmResponse.result?.paymentDetails?.productName ??"",
      productDescription: widget.confirmResponse.result?.paymentDetails?.productDetails ??"",
      callbackUrl: "http://www.edhp.com",
      // paymentType:"",
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

  @override
  Widget build(BuildContext context) {
    return ViewContainer(
        title: StringsManager.memberShips,
        body: SingleChildScrollView(
          child: Center(
            child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 16),
                  ),

                  TextButton(
                    onPressed: _clickCreateOrder,
                    style:ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF43E3B7)),
                    ),
                    child: const Text('الدفع'),
                  ),
                  Text(
                      _createOrderResult
                  ),

                  Text(
                      _getCashierStatusResult
                  ),
                  const Padding(padding: EdgeInsets.only(bottom: 16)),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _clickCreateOrder() {
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
        EasyLoading.showToast(_createOrderResult,duration: const Duration(seconds:5));
        debugPrint("httpResult=$_createOrderResult");
      });

      // h5 Response （Payment result check ）
      if(response.webJsResponse!=null){
        var status = response.webJsResponse?.orderStatus;
        debugPrint("webJsResponse.status=$status");
        if(status!=null){
          EasyLoading.showToast(status,duration: const Duration(seconds:5));
        }
        switch(status){
          case PayResultStatus.initial:
            break;
          case PayResultStatus.pending:
            EasyLoading.showToast("العملية معلقة",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.success:
            EasyLoading.showToast("تم الدفع بنجاح",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.fail:
            EasyLoading.showToast("لم تتم العملية حدث خطا",duration: const Duration(seconds:5));
            break;
          case PayResultStatus.close:
            break;
        }
      }
    });
  }
}
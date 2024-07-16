import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/payment/cubit/PaymentState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState>{

  PaymentCubit():super(PaymentInitialState());

  static PaymentCubit get(BuildContext context) => BlocProvider.of(context);

  cancelFailedMembership(String referenceCode,String amount,bool isCancelled) async{
    var json = {
      'ReferenceCode':referenceCode,
      'Amount': amount,
      'IsCancelled': isCancelled,
    };

    await DioHelper.postData(
      path: EndPoint.cancelMembershipRequest ,
      data: json,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      print("Cancel Done");
    }).catchError((error) {
      print(error.toString());
      print("Cancel Failed");
    });
  }
}
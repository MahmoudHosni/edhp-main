import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/payment_orders/cubit/PaymentOrdersState.dart';
import 'package:edhp/features/payment_orders/model/PaymentOrderDetails.dart';
import 'package:edhp/features/payment_orders/model/PaymentsOrderResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentOrdersCubit  extends Cubit<PaymentOrdersState>{
  PaymentOrdersCubit():super(InitialPaymentOrdersState());

  static PaymentOrdersCubit get(BuildContext context) => BlocProvider.of(context);

  getOrders() async{
    emit(InitialPaymentOrdersState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionOrdersRequests ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      PaymentsOrderResponse paymentsOrderResponse = PaymentsOrderResponse.fromJson(value.data);
      emit(PaymentOrdersLoadedSuccessfullyState(requests: paymentsOrderResponse));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentOrdersFailState(error: error));
    });
  }

  getOrderServices(int spSubscriptionRequestID) async{
    emit(InitialPaymentOrdersState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionRequestServices ,queryParameters: {
      "SpSubscriptionRequestID": spSubscriptionRequestID
    },
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      List<PaymentOrderDetails> requests = [];
      value.data.forEach((element) {
        print(element);
        requests.add(PaymentOrderDetails.fromJson(element));
      });
      emit(PaymentOrderDetailsLoadedSuccessfully(details: requests));
    }).catchError((error) {
      print(error.toString());
      emit(PaymentOrdersFailState(error: error));
    });
  }

  Future<Response> cancelOrderRequest(int spSubscriptionRequestID) async{
    emit(InitialPaymentOrdersState());
    return await DioHelper.getData(
      path: EndPoint.cancelSubscriptionRequest ,queryParameters:  {
      "id": spSubscriptionRequestID
    },
      token: CacheHelper.getData(key: Token),
    );
    // .then((value) {
    //   print(value.data);
    //   emit(PaymentOrderCanceledSuccessfullyState());
    // }).catchError((error) {
    //   print(error.toString());
    //   emit(PaymentOrdersFailState(error: error));
    // });
  }
}
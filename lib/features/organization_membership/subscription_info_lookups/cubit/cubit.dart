import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/organization_membership/subscription_info_lookups/cubit/states.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/cache_helper.dart';

class SubscriptionInfoLookUpCubit extends Cubit<SubscriptionInfoLookUpStates> {
  SubscriptionInfoLookUpCubit() : super(SubscriptionInfoLookUpInitialState());

  static SubscriptionInfoLookUpCubit get(BuildContext context) => BlocProvider.of(context);

  GetSubscriptionInfoLookupsModel ? subscriptionInfoLookupsModel;

  Future getNewAccessToken() async {
    emit(GetNewAccessTokenLoadingState());
    await DioHelper.getData(
      path: EndPoint.getNewAccessToken,
      token: token,
    ).then((value) {
      print('token : ${value.data['ResultObject']['AccessToken']}');
      token = value.data['ResultObject']['AccessToken'];
      print(token);
      CacheHelper.saveData(key: 'token', value: token);
      emit(GetNewAccessTokenSuccessfullyState());
      getSubscriptionInfoLookUps();
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getSubscriptionInfoLookUps()async{
    emit(SubscriptionInfoLookUpLoadingState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionInfoLookUps ,
      token: token,
    ).then((value) {
      print(value.data);
      subscriptionInfoLookupsModel = GetSubscriptionInfoLookupsModel.fromJson(value.data);
      print(subscriptionInfoLookupsModel!.states![0].name);
      emit(SubscriptionInfoLookUpSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(SubscriptionInfoLookUpErrorState());
    });
  }
}
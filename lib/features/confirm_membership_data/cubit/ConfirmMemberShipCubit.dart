import 'package:dio/dio.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMembershipState.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ConfirmMemberShipCubit extends Cubit<ConfirmMembershipState>{
  ConfirmMemberShipCubit() : super(ConfirmMembershipLoadingState());

  static ConfirmMemberShipCubit get(BuildContext context) => BlocProvider.of(context);

  requestSubscription(SubscriptionRequest subscriptionRequest) async{
    emit(ConfirmMembershipLoadingState());
    FormData formData ;
    if(subscriptionRequest.SubscriptionTypeID==1){
      formData = FormData.fromMap({
        // 'Access-Token':CacheHelper.getData(key: 'token'),
        'SubscriptionTypeID':subscriptionRequest.SubscriptionTypeID.toString(),
        'OrganizationID':subscriptionRequest.OrganizationID.toString(),
        'OrganizationMembershipNumber':"0",
        'MedicalCompanyID':subscriptionRequest.MedicalCompanyID.toString(),
        'MembershipTypeID':subscriptionRequest.MembershipTypeID.toString(),
        'Address':subscriptionRequest.Address,
        'IdentityNumber':subscriptionRequest.IdentityNumber,
        'StateID':subscriptionRequest.StateID.toString(),
        'CityID':subscriptionRequest.CityID.toString(),
        'Gender':subscriptionRequest.Gender.toString(),
        'BirthDate':subscriptionRequest.BirthDate,
        'SubscriptionStartDate':subscriptionRequest.SubscriptionStartDate,
        'SubscriptionEndDate':subscriptionRequest.SubscriptionEndDate,
        "PersonalImage": await MultipartFile.fromFile(subscriptionRequest.PersonalImage?.path ??'', filename:'PersonalImage'),
        "OrganizationMembershipNumberImage": await MultipartFile.fromFile(subscriptionRequest.PersonalImage?.path ??'', filename:'OrganizationMembershipNumberImage'),
        "NationalNumberImage": await MultipartFile.fromFile(subscriptionRequest.NationalNumberImage?.path ??'', filename:'NationalNumberImage')
      });
    }else{
      formData = FormData.fromMap({
        // 'Access-Token':CacheHelper.getData(key: 'token'),
        'SubscriptionTypeID':subscriptionRequest.SubscriptionTypeID.toString(),
        'OrganizationID':subscriptionRequest.OrganizationID.toString(),
        'OrganizationMembershipNumber':subscriptionRequest.OrganizationMembershipNumber,
        'MedicalCompanyID':subscriptionRequest.MedicalCompanyID.toString(),
        'MembershipTypeID':subscriptionRequest.MembershipTypeID.toString(),
        'Address':subscriptionRequest.Address,
        'IdentityNumber':subscriptionRequest.IdentityNumber,
        'StateID':subscriptionRequest.StateID.toString(),
        'CityID':subscriptionRequest.CityID.toString(),
        'Gender':subscriptionRequest.Gender.toString(),
        'BirthDate':subscriptionRequest.BirthDate,
        "PersonalImage": await MultipartFile.fromFile(subscriptionRequest.PersonalImage?.path ??'', filename:'PersonalImage'),
        "OrganizationMembershipNumberImage": await MultipartFile.fromFile(subscriptionRequest.OrganizationMembershipNumberImage?.path ??'', filename:'OrganizationMembershipNumberImage'),
        "NationalNumberImage": await MultipartFile.fromFile(subscriptionRequest.NationalNumberImage?.path ??'', filename:'NationalNumberImage')
      });
    }


    await DioHelper.postFormData(
      path: EndPoint.addNewSubscription ,
      data: formData,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print(value.data);
      ConfirmResponse res = ConfirmResponse.fromJson(value.data);
      ShowToast.showToastGreen(value.data);
      emit(ConfirmMembershipSuccessState(response: res));
    }).catchError((error) {
      print(error.toString());
      ShowToast.showToast(error.toString());
      emit(ConfirmMembershipErrorState());
    });
  }
}
import 'package:dio/dio.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/Utilites.dart';
import 'package:edhp/core/utils/app_components/widgets/ShowToast.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmResponse.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:edhp/features/confirm_membership_data/cubit/ConfirmMembershipState.dart';

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
        'OrganizationID':"0",
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
        "NationalNumberImage": await MultipartFile.fromFile(subscriptionRequest.NationalNumberImage?.path ??'', filename:'NationalNumberImage'),
        "RelationTypeID":subscriptionRequest.RelationTypeID,
        "ArabicName":subscriptionRequest.ArabicName,
        "EnglishName":subscriptionRequest.EnglishName,
        "MobileNumber":subscriptionRequest.MobileNumber
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
        'SubscriptionStartDate':subscriptionRequest.SubscriptionStartDate,
        'SubscriptionEndDate':subscriptionRequest.SubscriptionEndDate,
        "PersonalImage": await MultipartFile.fromFile(subscriptionRequest.PersonalImage?.path ??'', filename:'PersonalImage'),
        "OrganizationMembershipNumberImage": await MultipartFile.fromFile(subscriptionRequest.OrganizationMembershipNumberImage?.path ??'', filename:'OrganizationMembershipNumberImage'),
        "NationalNumberImage": await MultipartFile.fromFile(subscriptionRequest.NationalNumberImage?.path ??'', filename:'NationalNumberImage'),
        "RelationTypeID":subscriptionRequest.RelationTypeID,
        "ArabicName":subscriptionRequest.ArabicName,
        "EnglishName":subscriptionRequest.EnglishName,
        "MobileNumber":subscriptionRequest.MobileNumber
      });
    }


    await DioHelper.postFormData(
      path: EndPoint.addNewSubscription ,
      data: formData,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      // print(value.data);
      ConfirmResponse res = ConfirmResponse.fromJson(value.data);
      if(res.IsSuccess) {
        emit(ConfirmMembershipSuccessState(response: res));
      }else{
        ShowToast.showToast(res.Message??'');
        emit(ConfirmMembershipErrorState(error: res.Message??''));
      }
    }).catchError((error) {
      print(error.toString());
      ShowToast.showToast(error.toString());
      emit(ConfirmMembershipErrorState(error: error.toString()));
    });
  }

  addAnotherSubscription(SubscriptionRequest subscriptionRequest) async{
    emit(ConfirmMembershipLoadingState());
    FormData formData ;
    if(subscriptionRequest.SubscriptionTypeID==1){
      formData = FormData.fromMap({
        'SubscriptionTypeID':subscriptionRequest.SubscriptionTypeID.toString(),
        'MedicalCompanyID':subscriptionRequest.MedicalCompanyID.toString(),
        'MembershipTypeID':subscriptionRequest.MembershipTypeID.toString(),
        'IdentityNumber':subscriptionRequest.IdentityNumber,
        'OrganizationID':"0",
        'OrganizationMembershipNumber':"0",
        'SubscriptionStartDate':subscriptionRequest.SubscriptionStartDate,
        'SubscriptionEndDate':subscriptionRequest.SubscriptionEndDate,
        'Gender':subscriptionRequest.Gender.toString()
      });
    }else {
      formData = FormData.fromMap({
        'SubscriptionTypeID': subscriptionRequest.SubscriptionTypeID.toString(),
        'OrganizationID': subscriptionRequest.OrganizationID.toString(),
        'OrganizationMembershipNumber': subscriptionRequest
            .OrganizationMembershipNumber,
        'MedicalCompanyID': subscriptionRequest.MedicalCompanyID.toString(),
        'MembershipTypeID': subscriptionRequest.MembershipTypeID.toString(),
        'IdentityNumber': subscriptionRequest.IdentityNumber,
        'Gender': subscriptionRequest.Gender.toString(),
        'SubscriptionStartDate': subscriptionRequest.SubscriptionStartDate,
        'SubscriptionEndDate': subscriptionRequest.SubscriptionEndDate,
        "OrganizationMembershipNumberImage": await MultipartFile.fromFile(
            subscriptionRequest.OrganizationMembershipNumberImage?.path ?? '',
            filename: 'OrganizationMembershipNumberImage'),
      });
    }
      print("addAnotherSubscription <<<<<<<<<<<<<<<<");
      await DioHelper.postFormData(
        path: EndPoint.addNewSubscription ,
        data: formData,
        token: CacheHelper.getData(key: Token),
      ).then((value) {
        // print(value.data);
        ConfirmResponse res = ConfirmResponse.fromJson(value.data);
        if(res.IsSuccess) {
          emit(ConfirmMembershipSuccessState(response: res));
        }else{
          ShowToast.showToast(res.Message??'');
          emit(ConfirmMembershipErrorState(error: res.Message??''));
        }
      }).catchError((error) {
        print(error.toString());
        ShowToast.showToast(error.toString());
        emit(ConfirmMembershipErrorState(error: error.toString()));
      });
  }
}
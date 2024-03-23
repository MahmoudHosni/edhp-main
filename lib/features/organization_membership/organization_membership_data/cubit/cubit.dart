import 'dart:io';
import 'package:dio/dio.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/models/SubscriptionRequest.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class OrganizationMembershipDataCubit extends Cubit<OrganizationMembershipDataStates> {
  OrganizationMembershipDataCubit() : super(OrganizationMembershipDataInitiateState());

  static OrganizationMembershipDataCubit get(BuildContext context) => BlocProvider.of(context);

  File ? personalImage;
  File ? nationalIdImage;
  File ? orgCardImage;
  var picker = ImagePicker();
  var personalImagePath;
  var nationalIdImagePath;
  var orgCardImagePath;

  Future getOrganizationCardFromGallery(ImageSource source)async{
    final pickedFile = await picker.pickImage(source: source,imageQuality: 40);
    if(pickedFile != null){
      orgCardImage = File(pickedFile.path);
      orgCardImagePath = pickedFile.path;
      print('Path of Image:');
      print(pickedFile.path);
      emit(GetNationalIDImageFromGallerySuccessfullyState());
    }else{
      print('No Image Picked');
      emit(GetNationalIDImageFromGalleryErrorState());
    }
  }


  Future getPersonalImageFromGallery(ImageSource source)async{
    final pickedFile = await picker.pickImage(source: source,imageQuality: 40);
    if(pickedFile != null){
      personalImage = File(pickedFile.path);
      personalImagePath = pickedFile.path;
      print('Path of Image:');
      print(pickedFile.path);
      emit(GetPersonalImageFromGallerySuccessfullyState());
    }else{
      print('No Image Picked');
      emit(GetPersonalImageFromGalleryErrorState());
    }
  }

  Future getNationalIDImageFromGallery(ImageSource source)async{
    final pickedFile = await picker.pickImage(source: source,imageQuality: 40);
    if(pickedFile != null){
      nationalIdImage = File(pickedFile.path);
      nationalIdImagePath = pickedFile.path;
      print('Path of Image:');
      print(pickedFile.path);
      emit(GetNationalIDImageFromGallerySuccessfullyState());
    }else{
      print('No Image Picked');
      emit(GetNationalIDImageFromGalleryErrorState());
    }
  }

  GetSubscriptionInfoLookupsModel ? subscriptionInfoLookupsModel;

  Future getSubscriptionInfoLookUps()async{
    emit(GetSubscriptionInfoLookupsLoadingState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionInfoLookup ,
      token: token,
    ).then((value) {
      print(value.data);
      subscriptionInfoLookupsModel = GetSubscriptionInfoLookupsModel.fromJson(value.data);
      print(subscriptionInfoLookupsModel!.states![0].name);
      emit(GetSubscriptionInfoLookupsSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(GetSubscriptionInfoLookupsErrorState());
    });
  }

  Future<bool> requestSubscription(SubscriptionRequest subscriptionRequest) async{
    emit(GetSubscriptionInfoLookupsLoadingState());
    FormData formData = FormData.fromMap({
      // 'Access-Token':CacheHelper.getData(key: 'token'),
      'SubscriptionTypeID':"1",//subscriptionRequest.SubscriptionTypeID.toString(),
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

    await DioHelper.postFormData(
      path: EndPoint.addNewSubscription ,
      data: formData,
      token: CacheHelper.getData(key:  Token),
    ).then((value) {
      print(value.data);

      return Future(() => true);
    }).catchError((error) {
      print(error.toString());
      return Future(() => false);
    });
    return Future(() => false);
  }
}

import 'dart:io';

import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_colors.dart';
import 'package:edhp/features/membership_data/cubit/states.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MembershipDataCubit extends Cubit<MembershipDataStates>{
  MembershipDataCubit() : super(MembershipDataInitialState());

  static MembershipDataCubit get(BuildContext context) => BlocProvider.of(context);

  DateTime ? selectedDate;



  File ? profileImage;
  var picker = ImagePicker();
  var imagePath;

  Future getProfileImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      imagePath = profileImage;
      print('Path of Image:');
      print(pickedFile.path);
      emit(MembershipDataSelectProfileImageSuccessfullyState());
    }else{
      print('No Image Picked');
      emit(MembershipDataSelectProfileImageErrorState());
    }
  }

  File ? notationIdImage;
  var pickerNotationId = ImagePicker();
  var NotationIdImagePath;

  Future getNotationIdImageFromGallery()async{
    final pickedFile = await pickerNotationId.pickImage(source: ImageSource.gallery);
    if(pickedFile != null){
      notationIdImage = File(pickedFile.path);
      NotationIdImagePath = notationIdImage;
      print('Path of Image:');
      print(pickedFile.path);
      emit(MembershipDataSelectNationalIdImageSuccessfullyState());
    }else{
      print('No Image Picked');
      emit(MembershipDataSelectNationalIdImageErrorState());
    }
  }

  GetSubscriptionInfoLookupsModel ? subscriptionInfoLookupsModel;

  Future getSubscriptionInfoLookUps()async{
    emit(MembershipDataInitialState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionInfoLookup ,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print(value.data);
      subscriptionInfoLookupsModel = GetSubscriptionInfoLookupsModel.fromJson(value.data);
      print(subscriptionInfoLookupsModel!.states![0].name);
      emit(MembershipDataLoadStaticDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(MembershipDataLoadStaticDataErrorState());
    });
  }
}
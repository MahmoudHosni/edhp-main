import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/add_relatives/RelativesStates.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddRelativesCubit extends Cubit<RelativeDataStates>{
  GetSubscriptionInfoLookupsModel ? subscriptionInfoLookupsModel;
  File ? nationalIdImage;
  var pickerNotationId = ImagePicker();
  var NotationIdImagePath;
  DateTime ? selectedDate;
  File ? profileImage;
  var picker = ImagePicker();
  var imagePath;
  List<RelationType> relations = [
    RelationType(key: 1,value: "Husband"),
    RelationType(key: 2,value: "Wife"),
    RelationType(key: 3,value: "Son"),
    RelationType(key: 4,value: "Daughter"),
    RelationType(key: 5,value: "Father"),
    RelationType(key: 6,value: "Mother"),
  ];

  AddRelativesCubit() : super(RelativeDataInitialState());
  static AddRelativesCubit get(BuildContext context) => BlocProvider.of(context);

  Future getProfileImageFromGallery(ImageSource source)async{
    final pickedFile = await picker.pickImage(source: source,imageQuality: 40);
    if(pickedFile != null){
      profileImage = File(pickedFile.path);
      imagePath = profileImage;
      print('Path of Image:');
      print(pickedFile.path);
      emit(RelativeDataSelectProfileImageSuccessfullyState());
    }else{
      print('No Image Picked');
      emit(RelativeSelectProfileImageErrorState());
    }
  }

  Future getNotationIdImageFromGallery(ImageSource source)async{
    final pickedFile = await pickerNotationId.pickImage(source: source,imageQuality: 40);
    if(pickedFile != null){
      nationalIdImage = File(pickedFile.path);
      NotationIdImagePath = nationalIdImage;
      print('Path of Image:');
      print(pickedFile.path);
      emit(RelativeSelectNationalIdImageSuccessfullyState());
    }else{
      print('No Image Picked');
      emit(RelativeSelectNationalIdImageErrorState());
    }
  }

  Future getSubscriptionInfoLookUps()async{
    emit(RelativeDataInitialState());
    await DioHelper.getData(
      path: EndPoint.getSubscriptionInfoLookup ,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print(value.data);
      subscriptionInfoLookupsModel = GetSubscriptionInfoLookupsModel.fromJson(value.data);
      print(subscriptionInfoLookupsModel!.states![0].name);
      emit(RelativeDataLoadStaticDataSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RelativeDataLoadStaticDataErrorState());
    });
  }
}
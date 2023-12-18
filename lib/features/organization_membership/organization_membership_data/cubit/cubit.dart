import 'dart:io';

import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/organization_membership/organization_membership_data/cubit/states.dart';
import 'package:edhp/models/subscription_info_lookup_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/utils/app_colors.dart';

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

  Future getOrganizationCardFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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


  Future getPersonalImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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

  DateTime ? selectedBirthDate;

  Future<void> selectBirthDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1970, 1),
        lastDate: DateTime.now(),
        builder: (context, child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: AppColors.primaryBlueColor,
                onPrimary: AppColors.whiteColor,
                onSurface: AppColors.primaryBlueColor,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  primary: AppColors.primaryBlueColor, // button text color
                ),
              ),
            ),
            child: child!,
          );
        }
    );
    if (picked != null && picked != selectedBirthDate) {
      selectedBirthDate = picked;
      emit(OrganizationMembershipDataSelectDateState());
    }
  }

  Future getNationalIDImageFromGallery()async{
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
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
}

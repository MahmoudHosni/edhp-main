import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/edit_profile/cubit/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileCubit extends Cubit<EditProfileStates> {
  EditProfileCubit() : super(EditProfileInitiateState());

  static EditProfileCubit get(BuildContext context) =>BlocProvider.of(context);

  Future editProfile({
    required String name,
    required String username,
    required String mobileNumber,
    required String email,
    required String identityNumber,
}) async {
    emit(EditProfileLoadingState());
    await DioHelper.postData(
      path: EndPoint.updateProfile,
      token: token,
      data: {
        "ProfileID": loginModel!.resultObject!.profileID!.toInt(),
        "ProfileName": name,
        "UserName": username,
        "Gender": 1,
        "MobileNumber":mobileNumber,
        "Email":email,
        "IdentityNumber" :identityNumber
      },
    ).then((value) {
      print(value.data['ResultType']);
      emit(EditProfileSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(EditProfileErrorState());
    });
  }

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
      emit(EditProfileImagePickedSuccessState());
    }else{
      print('No Image Picked');
      emit(EditProfileImagePickedErrorState());
    }
  }

  void uploadFileToServer(File imagePath) async {
    Map<String, String> headers = {
      "Access-Token": token!,
    };
    emit(UploadProfileImageLoadingState());
    var request = http.MultipartRequest(
      "POST",
      Uri.parse('$baseUrl${EndPoint.updateProfileImage}'),
    );

    request.headers.addAll(headers);
    request.files.add(
      await http.MultipartFile.fromPath('profile_pic', imagePath.path),
    );

    request.send().then((response) {
      emit(UploadProfileImageSuccessfullyState());
      if (response.statusCode == 200) print("Uploaded!");
      http.Response.fromStream(response).then((value) {
        print(value);
      });
    }).catchError((error) {
      print(error.toString());
      emit(UploadProfileImageErrorState());
    });
  }

}
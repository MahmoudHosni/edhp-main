import 'dart:io';
import 'package:edhp/core/network/cache_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/models/user_profile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../../core/network/dio_helper.dart';
import 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit() : super(GetProfileInitial());

  static GetProfileCubit get(BuildContext context) => BlocProvider.of(context);

  GetUserProfile ? userProfileModel;

  Future getProfile() async {
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile ,
      token: token,
    ).then((value) {
      print(value.data);
      userProfileModel = GetUserProfile.fromJson(value.data);
      CacheHelper.saveData(key: 'name', value: userProfileModel?.userName??'');
      CacheHelper.saveData(key: 'profile', value: userProfileModel?.profileName);
      CacheHelper.saveData(key: 'id', value: userProfileModel?.profileID);
      CacheHelper.saveData(key: 'email', value: userProfileModel?.email??'');
      CacheHelper.saveData(key: 'identity', value: userProfileModel?.identityNumber??'');
      print(userProfileModel!.userName);
      emit(GetProfileSuccessfullyState());
      getImageProfile();
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }


  File ? profileImage;
  Future getImageProfile() async {
    emit(GetProfileImageLoadingState());
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl${EndPoint
                .imageProfile}?referenceTypeId=1&referenceId=${userProfileModel!
                .profileID}'),
        headers: {'Access-Token': token!},
      );
      final dir = await getTemporaryDirectory();
      var filename = '${dir.path}/image.png';
      // Save to filesystem
      profileImage = File(filename);
      await profileImage?.writeAsBytes(response.bodyBytes);

      emit(GetProfileImageSuccessfullyState());
    }catch(e){
      print(e.toString());
      emit(GetProfileImageErrorState());
    }

    // await DioHelper.getData(
    //   path: EndPoint.imageProfile ,
    //   queryParameters: {
    //     'referenceTypeId': userProfileModel!.profileID,
    //     'referenceId' : 1,
    //   },
    //   token: token,
    // ).then((value) {
    //   print('Get Image Profile: ');
    //   // profileImage = Image.memory(value.data.bodyBytes).image;
    //   profileImage = File(value.data);
    //   print(profileImage);
    //   print(value.data);
    //   emit(GetProfileImageSuccessfullyState());
    // }).catchError((error) {
    //   print('Error');
    //   print(error.toString());
    //   emit(GetProfileImageErrorState());
    // });

  }
}

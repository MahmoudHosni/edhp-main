import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:edhp/core/network/dio_helper.dart';
import 'package:edhp/core/network/end_point.dart';
import 'package:edhp/core/utils/app_constants.dart';
import 'package:edhp/features/home/cubit/MemberShipsResponse.dart';
import 'package:edhp/features/layout/cubit/states.dart';
import 'package:edhp/features/profile/cubit/get_profile_cubit.dart';
import 'package:edhp/models/Advertisement.dart';
import 'package:edhp/models/user_profile_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import '../../../core/network/cache_helper.dart';

List<MemberShipsResponse> memberShips = [];

class LayoutCubit extends Cubit<LayoutStates> {
  LayoutCubit() : super(LayoutInitialState());

  static LayoutCubit get(BuildContext context) => BlocProvider.of(context);

  List<Advertisement> advertisements = [];

  bool switchOfNotification = true;

  void changeSwitchOfNotification(bool value) {
    switchOfNotification = value;
    emit(ChangeNotificationSettingsState());
  }

  bool switchOfFingerPrint = true;

  void changeSwitchOfFingerPrint(bool value) {
    switchOfFingerPrint = value;
    emit(ChangeFingerPrintUponLoginSettingsState());
  }

  bool isArabic = true;

  void changeLanguage(bool value) {
    isArabic = value;
    emit(ChangeLanguageSettingsState());
  }

  Future getAdvertisements(BuildContext context) async {
    await DioHelper.getData(
      path: EndPoint.getAdvertisements,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      advertisements = [];
      adsImage = [];
      value.data.forEach((element) {
        var adv = Advertisement.fromJson(element);
        print(adv.iD.toString());
        adsImage.add(
            '$baseUrl${EndPoint.imgPath}?referenceTypeId=4&referenceId=${adv.iD}&id=${Random().nextInt(100000)}');
        advertisements?.add(adv);
      });

      emit(AdvertisementStateLoadSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(AdvertisementStateLoadError());
    });
  }

  Future loadData(BuildContext context) async {
    getProfile(context);
    getAdvertisements(context);
    getMySubscriptions();
  }

  Future getProfile(BuildContext context) async {
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print(value.data);
      GetProfileCubit.get(context).userProfileModel =
          GetUserProfile.fromJson(value.data);
      print(GetProfileCubit.get(context).userProfileModel!.userName);
      CacheHelper.saveData(
          key: 'name',
          value: GetProfileCubit.get(context).userProfileModel?.userName ?? '');
      CacheHelper.saveData(
          key: 'profile',
          value: GetProfileCubit.get(context).userProfileModel?.profileName);
      CacheHelper.saveData(
          key: 'id',
          value: GetProfileCubit.get(context).userProfileModel?.profileID);
      CacheHelper.saveData(
          key: 'email',
          value: GetProfileCubit.get(context).userProfileModel?.email ?? '');
      CacheHelper.saveData(
          key: 'identity',
          value:
              GetProfileCubit.get(context).userProfileModel?.identityNumber ??
                  '');
      emit(GetProfileSuccessfullyState());
      getAdvertisements(context);
      getImageProfile(context);
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
    });
  }

  Future getImageProfile(BuildContext context) async {
    emit(GetProfileImageLoadingState());
    try {
      final response = await http.get(
        Uri.parse(
            '$baseUrl${EndPoint.imageProfile}?referenceTypeId=1&referenceId=${GetProfileCubit.get(context).userProfileModel!.profileID}'),
        headers: {'Access-Token': token!},
      );
      final dir = await getTemporaryDirectory();
      var filename = '${dir.path}/image.png';
      // Save to filesystem
      GetProfileCubit.get(context).profileImage = File(filename);
      await GetProfileCubit.get(context)
          .profileImage
          ?.writeAsBytes(response.bodyBytes);
      emit(GetProfileImageSuccessfullyState());
    } catch (e) {
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

  List<String> adsImage = [
    // 'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22220740/auto-draft-1317-1024x683.jpg',
    // 'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22220827/auto-draft-1320-1024x683.jpg',
    // 'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22221000/auto-draft-1326-1024x683.jpg',
    // 'https://uicreative.s3.ap-southeast-1.amazonaws.com/wp-content/uploads/2021/02/22221000/auto-draft-1326.jpg',
    // 'https://elements-cover-images-0.imgix.net/ba74bcfa-aa7c-43e6-b726-2bba7733d5fb?auto=compress%2Cformat&w=1370&fit=max&s=f2de7d383a6ab16de8dd4ebf90382d68'
  ];
  Random random = Random();
  int? index = 0;

  void changeAdsImageRightIcon() {
    index = random.nextInt(advertisements.length);
    emit(ChangeAdsImage());
  }

  Future getNewAccessToken(BuildContext context) async {
    emit(GetNewAccessTokenLoadingState());
    print("getNewAccessToken    >>>>>>           ${token!}");
    await DioHelper.getData(
      path: EndPoint.getNewAccessToken,
      token: token,
    ).then((value) {
      print('token : ${value.data['ResultObject']['AccessToken']}');
      token = value.data['ResultObject']['AccessToken'];
      print(token);
      CacheHelper.saveData(key: 'token', value: token);
      emit(GetNewAccessTokenSuccessfullyState());
      getProfile(context);
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getStaticData(BuildContext context) async {
    await DioHelper.getData(
      path: EndPoint.getStaticData,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {}).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getMySubscriptions() async {
    await DioHelper.getData(
      path: EndPoint.getMySubscriptions,
      token: CacheHelper.getData(key: 'token'),
    ).then((value) {
      print("::::::: getMySubscriptions ::::::::");
      value.data.forEach((element) {
        memberShips.add(MemberShipsResponse.fromJson(element));
      });
      emit(MemberShipsStateLoadSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }
}

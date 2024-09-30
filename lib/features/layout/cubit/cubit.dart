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
      token: CacheHelper.getData(key: Token),
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
      getProfile(context);
    }).catchError((error) {
      print(error.toString());
      emit(AdvertisementStateLoadError());
      getProfile(context);
    });
  }

  Future loadData(BuildContext context) async {
    getAdvertisements(context);
  }

  Future getProfile(BuildContext context) async {
    emit(GetProfileLoadingState());
    await DioHelper.getData(
      path: EndPoint.getProfile,
      token: CacheHelper.getData(key: Token),
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
      getMySubscriptions();
      // getImageProfile(context);
    }).catchError((error) {
      print(error.toString());
      emit(GetProfileErrorState());
      getMySubscriptions();
    });
  }

  // Future getImageProfile(BuildContext context) async {
  //   emit(GetProfileImageLoadingState());
  //   try {
  //     final response = await http.get(
  //       Uri.parse(
  //           '$baseUrl${EndPoint.imageProfile}?referenceTypeId=1&referenceId=${GetProfileCubit.get(context).userProfileModel!.profileID}'),
  //       headers: {'Access-Token': token!},
  //     );
  //     final dir = await getTemporaryDirectory();
  //     var filename = '${dir.path}/image.png';
  //     // Save to filesystem
  //     GetProfileCubit.get(context).profileImage = File(filename);
  //     // await GetProfileCubit.get(context)
  //     //     .profileImage
  //     //     ?.writeAsBytes(response.bodyBytes);
  //     emit(GetProfileImageSuccessfullyState());
  //   } catch (e) {
  //     print(e.toString());
  //     emit(GetProfileImageErrorState());
  //   }
  // }

  List<String> adsImage = [];

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
      CacheHelper.saveData(key: Token, value: token);
      emit(GetNewAccessTokenSuccessfullyState());
      // getProfile(context);
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getStaticData(BuildContext context) async {
    await DioHelper.getData(
      path: EndPoint.getStaticData,
      token: CacheHelper.getData(key: Token),
    ).then((value) {}).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getMySubscriptions() async {
    await DioHelper.getData(
      path: EndPoint.getMySubscriptions,
      token: CacheHelper.getData(key: Token),
    ).then((value) {
      print("::::::: getMySubscriptions ::::::::");
      memberShips.clear();
      value.data.forEach((element) {
        print(element);
        var mbElement = MemberShipsResponse.fromJson(element);
        mbElement.Name= CacheHelper.getData(key: 'profile');
        mbElement.SubscriberProfileID = CacheHelper.getData(key: "id").toString();
        memberShips.add(mbElement);
      });
      emit(MemberShipsStateLoadSuccess());
      getAppVersion();
    }).catchError((error) {
      print(error.toString());
      emit(GetNewAccessTokenErrorState());
    });
  }

  Future getAppVersion() async{
    await DioHelper.getData(path: EndPoint.getAppVerion).then((value) =>
           emit(OnGetAppVersion(newAppVersion: value.data.toString().replaceAll("\"", "") , currentAppVersion: CacheHelper.getData(key: AppVersion) ?? "0.0.3.1".toString()))
        );
  }
}
